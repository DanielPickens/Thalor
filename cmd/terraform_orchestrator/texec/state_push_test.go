// Copyright (c) danielpickens, Inc.
// SPDX-License-Identifier: MPL-2.0

package texec

import (
	"context"
	"testing"

	"github.com/danielpickens/Thalor-exec/texec/internal/testutil"
)

func TestStatePushCmd(t *testing.T) {
	tf, err := NewTerraform(t.TempDir(), tfVersion(t, testutil.Latest_v1))
	if err != nil {
		t.Fatal(err)
	}

	tf.SetEnv(map[string]string{})

	t.Run("defaults", func(t *testing.T) {
		statePushCmd, err := tf.statePushCmd(context.Background(), "testpath")
		if err != nil {
			t.Fatal(err)
		}

		assertCmd(t, []string{
			"state",
			"push",
			"-lock=false",
			"-lock-timeout=0s",
			"testpath",
		}, nil, statePushCmd)
	})

	t.Run("override all defaults", func(t *testing.T) {
		statePushCmd, err := tf.statePushCmd(context.Background(), "testpath", Force(true), Lock(true), LockTimeout("10s"))
		if err != nil {
			t.Fatal(err)
		}

		assertCmd(t, []string{
			"state",
			"push",
			"-force",
			"-lock=true",
			"-lock-timeout=10s",
			"testpath",
		}, nil, statePushCmd)
	})
}