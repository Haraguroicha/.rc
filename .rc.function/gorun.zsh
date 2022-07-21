#!/bin/zsh

function g() {
	export TIMESTAMP=$(date -u '+%Y-%m-%d_%H:%M:%S_%Z')
	export VERSION=$(git describe --tag)
	export HASH=$(git rev-parse HEAD)
	export TAG_VERSION=$(git describe --tags --long --dirty --always)
	export LD_FLAGS=`(cat << FLAG
-s
-w
-X main.appVersion=${VERSION}
-X main.buildDate=${TIMESTAMP}
-X main.commitHash=${HASH}
-X main.tagName=${TAG_VERSION}
FLAG
) | xargs`
	go run -ldflags "${LD_FLAGS} -v" . "$@"
}
