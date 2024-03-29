#!/usr/bin/env zsh

g () {
	#set -Eexo pipefail
	export DIR=$( cd "$( dirname "$0" )" && pwd )
	export TIMESTAMP=$(date -u '+%Y-%m-%d_%H:%M:%S_%Z')
	export DIRTY_FLAG="$([ "$(git diff --stat)" != "" ] && echo "-dirty")"
	export VERSION=$(git describe --tag)
	export HASH=$(git rev-parse HEAD)
	export SHORT_HASH=$(git rev-parse --short=8 HEAD)
	export TAG_VERSION=$(git describe --tags --long --dirty --always)
	export LD_FLAGS=`(cat << FLAG
-s
-w
-X main.appVersion="${VERSION}"
-X main.buildDate="${TIMESTAMP}"
-X main.commitHash="${HASH}"
-X main.tagName="${TAG_VERSION}"
FLAG
) | xargs`
	go run -trimpath -gcflags "all=-trimpath=$DIR" -asmflags="all=-trimpath=$DIR" -ldflags "${LD_FLAGS} -v" -tags "${BUILD_TAGS}"  . "$@"
}
