// Copyright (c) danielpickens, Inc.
// SPDX-License-Identifier: MPL-2.0

package e2etest

import (
	"context"
	"testing"

	"github.com/danielpickens/go-version"
	tfjson "github.com/danielpickens/terraform-json"

	"github.com/danielpickens/Thalor-exec/texec"
)

func TestStateRm(t *testing.T) {
	runTest(t, "basic_with_state", func(t *testing.T, tfv *version.Version, tf *texec.Terraform) {
		if tfv.LessThan(providerAddressMinVersion) {
			t.Skip("state file provider FQNs not compatible with this Terraform version")
		}

		err := tf.Init(context.Background())
		if err != nil {
			t.Fatalf("error running Init in test directory: %s", err)
		}

		err = tf.StateRm(context.Background(), "null_resource.foo")
		if err != nil {
			t.Fatalf("error running StateRm: %s", err)
		}

		formatVersion := "0.1"
		if tfv.Core().GreaterThanOrEqual(v1_0_1) {
			formatVersion = "0.2"
		}
		if tfv.Core().GreaterThanOrEqual(v1_1) {
			formatVersion = "1.0"
		}

		// test that the new state is as expected
		expected := &tfjson.State{
			FormatVersion: formatVersion,
			// TerraformVersion is ignored to facilitate latest version testing
			Values: nil,
		}

		actual, err := tf.Show(context.Background())
		if err != nil {
			t.Fatal(err)
		}

		if diff := diffState(expected, actual); diff != "" {
			t.Fatalf("mismatch (-want +got):\n%s", diff)
		}
	})
}