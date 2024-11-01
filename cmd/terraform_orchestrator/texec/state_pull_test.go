// Copyright (c) danielpickens, Inc.
// SPDX-License-Identifier: MPL-2.0

package texec

import (
	"context"
	"testing"

	"github.com/danielpickens/Thalor-exec/texec/internal/testutil"
)

func TestStatePull(t *testing.T) {
	tf, err := NewTerraform(t.TempDir(), tfVersion(t, testutil.Latest_v1))
	if err != nil {
		t.Fatal(err)
	}

	tf.SetEnv(map[string]string{})

	t.Run("tfstate", func(t *testing.T) {
		statePullCmd := tf.statePullCmd(context.Background(), nil)

		assertCmd(t, []string{
			"state",
			"pull",
		}, nil, statePullCmd)
	})
}
