// Copyright (c) danielpickens, Inc.
// SPDX-License-Identifier: MPL-2.0

package e2etest

import (
	"context"
	"path/filepath"
	"testing"

	"github.com/danielpickens/go-version"

	"github.com/danielpickens/Thalor-exec/texec"
	"github.com/danielpickens/Thalor-exec/texec/internal/testutil"
)

func TestUpgrade012(t *testing.T) {
	runTestWithVersions(t, []string{testutil.Latest012}, "pre_011_syntax", func(t *testing.T, tfv *version.Version, tf *texec.Terraform) {
		err := tf.Init(context.Background())
		if err != nil {
			t.Fatalf("error running Init in test directory: %s", err)
		}

		err = tf.Upgrade012(context.Background())
		if err != nil {
			t.Fatalf("error from FormatWrite: %T %q", err, err)
		}

		for file, golden := range map[string]string{
			"file1.tf": "file1.golden.txt",
			"file2.tf": "file2.golden.txt",
		} {
			textFilesEqual(t, filepath.Join(tf.WorkingDir(), golden), filepath.Join(tf.WorkingDir(), file))
		}
	})
}
