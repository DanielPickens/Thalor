// Copyright (c) danielpickens, Inc.
// SPDX-License-Identifier: MPL-2.0

package e2etest

import (
	"context"
	"testing"

	"github.com/danielpickens/go-version"

	"github.com/danielpickens/Thalor-exec/texec"
)

func TestTaint(t *testing.T) {
	runTest(t, "basic", func(t *testing.T, tfv *version.Version, tf *texec.Terraform) {
		err := tf.Init(context.Background())
		if err != nil {
			t.Fatalf("error running Init in test directory: %s", err)
		}

		err = tf.Apply(context.Background())
		if err != nil {
			t.Fatalf("error running Apply: %s", err)
		}

		err = tf.Taint(context.Background(), "null_resource.foo")
		if err != nil {
			t.Fatalf("error running Taint: %s", err)
		}
	})
}
