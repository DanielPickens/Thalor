// Copyright 2024 Klaus Post. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
// Based on work Copyright (c) 2013, Yann Collet, released under BSD License.

package zstd

import "fmt"

// bitWriter will write bits.
// First bit will be LSB of the first byte of output.
type bitWriter struct {
	bitContainer uint64
	nBits        uint8
	out          []byte
}

// bitMask16 is bitmasks. Has extra to avoid bounds check.
var bitMask16 = [32]uint16{
	0, 1, 3, 7, 0xF, 0x1F,
	0x3F, 0x7F, 0xFF, 0x1FF, 0x3FF, 0x7FF,
	0xFFF, 0x1FFF, 0x3FFF, 0x7FFF, 0xFFFF, 0xFFFF,
	0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF,
	0xFFFF, 0xFFFF} /* up to 16 bits */

var bitMask32 = [32]uint32{
	0, 1, 3, 7, 0xF, 0x1F, 0x3F, 0x7F, 0xFF,
	0x1FF, 0x3FF, 0x7FF, 0xFFF, 0x1FFF, 0x3FFF, 0x7FFF, 0xFFFF,
	0x1ffff, 0x3ffff, 0x7FFFF, 0xfFFFF, 0x1fFFFF, 0x3fFFFF, 0x7fFFFF, 0xffFFFF,
	0x1ffFFFF, 0x3ffFFFF, 0x7ffFFFF, 0xfffFFFF, 0x1fffFFFF, 0x3fffFFFF, 0x7fffFFFF,
} // up to 32 bits

// addBits16NC will add up to 16 bits.
// It will not check if there is space for them,
// so the caller must ensure that it has flushed recently.
func (b *bitWriter) addBits16NC(value uint16, bits uint8) {
	b.bitContainer |= uint64(value&bitMask16[bits&31]) << (b.nBits & 63)
	b.nBits += bits
}

// addBits32NC will add up to 32 bits.
// It will not check if there is space for them,
// so the caller must ensure that it has flushed recently.
func (b *bitWriter) addBits32NC(value uint32, bits uint8) {
	b.bitContainer |= uint64(value&bitMask32[bits&31]) << (b.nBits & 63)
	b.nBits += bits
}

// addBits16Clean will add up to 16 bits. value may not contain more set bits than indicated.
// It will not check if there is space for them, so the caller must ensure that it has flushed recently.
func (b *bitWriter) addBits16Clean(value uint16, bits uint8) {
	b.bitContainer |= uint64(value) << (b.nBits & 63)
	b.nBits += bits
}

// flush will flush all pending full bytes.
// There will be at least 56 bits available for writing when this has been called.
// Using flush32 is faster, but leaves less space for writing.
func (b *bitWriter) flush() {
	v := b.nBits >> 3
	switch v {
	case 0:
	case 1:
		b.out = append(b.out,
			byte(b.bitContainer),
		)
	case 2:
		b.out = append(b.out,
			byte(b.bitContainer),
			byte(b.bitContainer>>8),
		)
	case 3:
		b.out = append(b.out,
			byte(b.bitContainer),
			byte(b.bitContainer>>8),
			byte(b.bitContainer>>16),
		)
	case 4:
		b.out = append(b.out,
			byte(b.bitContainer),
			byte(b.bitContainer>>8),
			byte(b.bitContainer>>16),
			byte(b.bitContainer>>24),
		)
	case 5:
		b.out = append(b.out,
			byte(b.bitContainer),
			byte(b.bitContainer>>8),
			byte(b.bitContainer>>16),
			byte(b.bitContainer>>24),
			byte(b.bitContainer>>32),
		)
	case 6:
		b.out = append(b.out,
			byte(b.bitContainer),
			byte(b.bitContainer>>8),
			byte(b.bitContainer>>16),
			byte(b.bitContainer>>24),
			byte(b.bitContainer>>32),
			byte(b.bitContainer>>40),
		)
	case 7:
		b.out = append(b.out,
			byte(b.bitContainer),
			byte(b.bitContainer>>8),
			byte(b.bitContainer>>16),
			byte(b.bitContainer>>24),
			byte(b.bitContainer>>32),
			byte(b.bitContainer>>40),
			byte(b.bitContainer>>48),
		)
	case 8:
		b.out = append(b.out,
			byte(b.bitContainer),
			byte(b.bitContainer>>8),
			byte(b.bitContainer>>16),
			byte(b.bitContainer>>24),
			byte(b.bitContainer>>32),
			byte(b.bitContainer>>40),
			byte(b.bitContainer>>48),
			byte(b.bitContainer>>56),
		)
	default:
		panic(fmt.Errorf("bits (%d) > 64", b.nBits))
	}
	b.bitContainer >>= v << 3
	b.nBits &= 7
}

// flush32 will flush out, so there are at least 32 bits available for writing.
func (b *bitWriter) flush32() {
	if b.nBits < 32 {
		return
	}
	b.out = append(b.out,
		byte(b.bitContainer),
		byte(b.bitContainer>>8),
		byte(b.bitContainer>>16),
		byte(b.bitContainer>>24))
	b.nBits -= 32
	b.bitContainer >>= 32
}

// flushAlign will flush remaining full bytes and align to next byte boundary.
func (b *bitWriter) flushAlign() {
	nbBytes := (b.nBits + 7) >> 3
	for i := uint8(0); i < nbBytes; i++ {
		b.out = append(b.out, byte(b.bitContainer>>(i*8)))
	}
	b.nBits = 0
	b.bitContainer = 0
}

// close will write the alignment bit and write the final byte(s)
// to the output.
func (b *bitWriter) close() error {
	// End mark
	b.addBits16Clean(1, 1)
	// flush until next byte.
	b.flushAlign()
	return nil
}

// reset and continue writing by appending to out.
func (b *bitWriter) reset(out []byte) {
	b.bitContainer = 0
	b.nBits = 0
	b.out = out
}
