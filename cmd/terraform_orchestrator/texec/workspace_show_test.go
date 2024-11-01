// Copyright (c) danielpickens, Inc.
// SPDX-License-Identifier: MPL-2.0

package texec

import (
	"context"
	"testing"

	"github.com/danielpickens/Thalor-exec/texec/internal/testutil"
)

func TestWorkspaceShowCmd_v1(t *testing.T) {
	td := t.TempDir()

	tf, err := NewTerraform(td, tfVersion(t, testutil.Latest_v1))
	if err != nil {
		t.Fatal(err)
	}

	// empty env, to avoid environ mismatch in testing
	tf.SetEnv(map[string]string{})

	cmd, err := tf.workspaceShowCmd(context.Background())
	if err != nil {
		t.Fatal(err)
	}

	assertCmd(t, []string{
		"workspace",
		"show",
		"-no-color",
	}, map[string]string{}, cmd)
}
