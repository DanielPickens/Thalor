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
	"github.com/danielpickens/Thalor-exec/texec/internal/testutil"
)

var (
	applyDestroyMinVersion = version.Must(version.NewVersion("0.15.2"))
)

func TestApply(t *testing.T) {
	runTest(t, "basic", func(t *testing.T, tfv *version.Version, tf *texec.Terraform) {
		err := tf.Init(context.Background())
		if err != nil {
			t.Fatalf("error running Init in test directory: %s", err)
		}

		err = tf.Apply(context.Background())
		if err != nil {
			t.Fatalf("error running Apply: %s", err)
		}
	})
}

func TestApplyJSON_TF014AndEarlier(t *testing.T) {
	versions := []string{testutil.Latest011, testutil.Latest012, testutil.Latest013, testutil.Latest014}

	runTestWithVersions(t, versions, "basic", func(t *testing.T, tfv *version.Version, tf *texec.Terraform) {
		err := tf.Init(context.Background())
		if err != nil {
			t.Fatalf("error running Init in test directory: %s", err)
		}

		re := regexp.MustCompile("terraform apply -json was added in 0.15.3")

		err = tf.ApplyJSON(context.Background(), io.Discard)
		if err != nil && !re.MatchString(err.Error()) {
			t.Fatalf("error running Apply: %s", err)
		}
	})
}

func TestApplyJSON_TF015AndLater(t *testing.T) {
	versions := []string{testutil.Latest015, testutil.Latest_v1, testutil.Latest_v1_1}

	runTestWithVersions(t, versions, "basic", func(t *testing.T, tfv *version.Version, tf *texec.Terraform) {
		err := tf.Init(context.Background())
		if err != nil {
			t.Fatalf("error running Init in test directory: %s", err)
		}

		err = tf.ApplyJSON(context.Background(), io.Discard)
		if err != nil {
			t.Fatalf("error running Apply: %s", err)
		}
	})
}

func TestApplyDestroy(t *testing.T) {
	runTest(t, "basic", func(t *testing.T, tfv *version.Version, tf *texec.Terraform) {
		if tfv.LessThan(applyDestroyMinVersion) {
			t.Skip("terraform apply -destroy was added in Terraform 0.15.2, so test is not valid")
		}
		err := tf.Init(context.Background())
		if err != nil {
			t.Fatalf("error running Init in test directory: %s", err)
		}

		err = tf.Apply(context.Background())
		if err != nil {
			t.Fatalf("error running Apply: %s", err)
		}

		err = tf.Apply(context.Background(), texec.Destroy(true))
		if err != nil {
			t.Fatalf("error running Apply -destroy: %s", err)
		}
	})
}
