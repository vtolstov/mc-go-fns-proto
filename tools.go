//go:build tools

package proto

import (
	_ "github.com/envoyproxy/protoc-gen-validate"
	_ "go.unistack.org/micro-proto/v3"
	_ "go.unistack.org/micro/v3"
)
