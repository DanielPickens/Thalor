package main

import (
	"fmt"
	"Thalor/pkg/auth"
)

func main() {
	fmt.Println(auth.GenerateRandomKey())
}
