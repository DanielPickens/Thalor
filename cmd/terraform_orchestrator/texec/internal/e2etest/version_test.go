// Copyright (c) danielpickens, Inc.
// SPDX-License-Identifier: MPL-2.0

package e2etest

import (
	"context"
	"testing"

	"github.com/danielpickens/go-version"

	"github.com/danielpickens/Thalor-exec/texec"
)

func TestVersion(t *testing.T) {
	runTest(t, "basic", func(t *testing.T, tfv *version.Version, tf *texec.Terraform) {
		ctx := context.Background()

		err := tf.Init(ctx)
		if err != nil {
			t.Fatal(err)
		}

		v, _, err := tf.Version(ctx, false)
		if err != nil {
			t.Fatal(err)
		}
		if !v.Equal(tfv) {
			t.Fatalf("expected version %q, got %q", tfv, v)
		}

		// TODO: test/assert provider info

		// force execution / skip cache as well
		v, _, err = tf.Version(ctx, true)
		if err != nil {
			t.Fatal(err)
		}
		if !v.Equal(tfv) {
			t.Fatalf("expected version %q, got %q", tfv, v)
		}
	})
}