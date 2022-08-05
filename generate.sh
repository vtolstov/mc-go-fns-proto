#!/bin/sh -e

INC=$(go list -f '{{ .Dir }}' -m go.unistack.org/micro-proto/v3)
INC_CODEC=$(go list -f '{{ .Dir }}' -m go.unistack.org/micro/v3)
INC_VALIDATE=$(go list -f '{{ .Dir }}' -m github.com/envoyproxy/protoc-gen-validate)
ARGS="-I${INC} -I${INC_CODEC} -I${INC_VALIDATE} -Iproto"

protoc $ARGS --go_out=paths=source_relative:./proto/ proto/*.proto

protoc $ARGS --go-micro_out=components="micro|http",debug=true,tag_path=./proto/,paths=source_relative:./proto/ proto/*.proto

protoc $ARGS --go-micro_out=openapi_file=apidocs.swagger.json,components="openapiv3",debug=true,paths=source_relative:./proto/ proto/*.proto

protoc $ARGS --validate_out=lang=go,paths=source_relative:./proto/ proto/*.proto

