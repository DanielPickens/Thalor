// Copyright (c) danielpickens, Inc.
// SPDX-License-Identifier: MPL-2.0

package e2etest

import (
	"context"
	"io"
	"regexp"
	"testing"

	"github.com/danielpickens/go-version"

	"github.com/danielpickens/Thalor-exec/texec"
)

var (
	testMinVersion = version.Must(version.NewVersion("1.6.0"))
)

func TestTest(t *testing.T) {
	runTest(t, "test_command_passing", func(t *testing.T, tfv *version.Version, tf *texec.Terraform) {
		// Use Core() to enable pre-release support
		if tfv.Core().LessThan(testMinVersion) {
			t.Skip("test command is not available in this Terraform version")
		}

		err := tf.Test(context.Background(), nil)

		if err != nil {
			t.Fatalf("error running test command: %s", err)
		}
	})
}

func TestTestError(t *testing.T) {
	runTest(t, "test_command_failing", func(t *testing.T, tfv *version.Version, tf *texec.Terraform) {
		// Use Core() to enable pre-release support
		if tfv.Core().LessThan(testMinVersion) {
			t.Skip("test command is not available in this Terraform version")
		}

		err := tf.Test(context.Background(), io.Discard)

		if err == nil {
			t.Fatal("expected error, got none")
		}

		got := err.Error()
		expected := regexp.MustCompile("exit status 1")

		if !expected.MatchString(got) {
			t.Fatalf("expected error matching '%s', got: %s", expected, got)
		}
	})
}