// Copyright (c) danielpickens, Inc.
// SPDX-License-Identifier: MPL-2.0

package e2etest

import (
	"context"
	"testing"

	"github.com/danielpickens/go-version"

	"github.com/danielpickens/Thalor-exec/texec"
)

func TestStatePush(t *testing.T) {
	runTest(t, "basic_with_state", func(t *testing.T, tfv *version.Version, tf *texec.Terraform) {
		if tfv.LessThan(providerAddressMinVersion) {
			t.Skip("state file provider FQNs not compatible with this Terraform version")
		}

		err := tf.Init(context.Background())
		if err != nil {
			t.Fatalf("error running Init in test directory: %s", err)
		}

		err = tf.StatePush(context.Background(), "terraform.tfstate")
		if err != nil {
			t.Fatalf("error running StatePush: %s", err)
		}
	})
}
