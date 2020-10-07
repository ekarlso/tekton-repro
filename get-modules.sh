#!/bin/bash

set -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

rm -rf cue.mod
mkdir cue.mod

export GO111MODULE=on
go get github.com/tektoncd/pipeline/pkg/apis/...@v0.17.0
go get github.com/tektoncd/triggers/pkg/apis/...@v0.8.0

cue get go github.com/tektoncd/pipeline/pkg/apis/...
cue get go github.com/tektoncd/triggers/pkg/apis/...
