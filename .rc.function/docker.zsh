#!/usr/bin/env zsh

OLD_DOCKER_BIN=$(which docker)

docker-native () {
	(
		$OLD_DOCKER_BIN $*
	)
}

docker () {
	(
		#export DOCKER_HOST=$(podman system connection list --format=json | jq -r '.[] | select(.Default) | .URI' | awk -F'/run' '{print $1}')
		export DOCKER_HOST=unix://${HOME}/.local/share/containers/podman/machine/podman-machine-default/podman.sock
		podman $*
	)
}
