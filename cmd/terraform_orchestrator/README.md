
### Thalor-exec

A Go module for constructing and running [Terraform](https://terraform.io) CLI commands via layer above cli structure. Structured return values use the data types defined in [terraform-json](https://github.com/danielpickens/terraform-json).

The [Terraform Plugin Framework](https://github.com/danielpickens/terraform-plugin-framework) is the canonical Go interface (SDK) for Terraform plugins using the gRPC protocol. This library is intended for use in Go programs that make use of Terraform's other interface, the CLI. Importing this library is preferable to importing `github.com/danielpickens/terraform/command`, because the latter is not intended for use outside Terraform Core.

While Thalor-exec is already widely used, please note that this module is **not yet at v1.0.0**, and that therefore breaking changes may occur in minor releases.

We strictly follow [semantic versioning](https://semver.org).

## Go compatibility

This library is built in Go, and uses the [support policy](https://golang.org/doc/devel/release.html#policy) of Go as its support policy. The two latest major releases of Go are supported by Thalor-exec.

Currently, that means Go **1.18** or later must be used.

## Usage

The `Terraform` struct must be initialised with `NewTerraform(workingDir, execPath)`. 

Top-level Terraform commands each have their own function, which will return either `error` or `(T, error)`, where `T` is a `terraform-json` type.


### Example


```go
package main

import (
	"context"
	"fmt"
	"log"

	"github.com/danielpickens/go-version"
	"github.com/danielpickens/hc-install/product"
	"github.com/danielpickens/hc-install/releases"
	"github.com/danielpickens/Thalor-exec/texec"
)

func main() {
	installer := &releases.ExactVersion{
		Product: product.Terraform,
		Version: version.Must(version.NewVersion("1.0.6")),
	}

	execPath, err := installer.Install(context.Background())
	if err != nil {
		log.Fatalf("error installing Terraform: %s", err)
	}

	workingDir := "/path/to/working/dir"
	tf, err := texec.NewTerraform(workingDir, execPath)
	if err != nil {
		log.Fatalf("error running NewTerraform: %s", err)
	}

	err = tf.Init(context.Background(), texec.Upgrade(true))
	if err != nil {
		log.Fatalf("error running Init: %s", err)
	}

	state, err := tf.Show(context.Background())
	if err != nil {
		log.Fatalf("error running Show: %s", err)
	}

	fmt.Println(state.FormatVersion) // "0.1"
}
```

## Testing Terraform binaries

The Thalor-exec test suite contains end-to-end tests which run realistic workflows against a real Terraform binary using `texec.Terraform{}`.

To run these tests with a local Terraform binary, set the environment variable `TEXEC_E2ETEST_TERRAFORM_PATH` to its path and run:
```sh
go test -timeout=20m ./texec/internal/e2etest
```

