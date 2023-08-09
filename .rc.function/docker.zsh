#!/usr/bin/env zsh

OLD_DOCKER_BIN=$(which docker)

docker-native () {
	(
		$OLD_DOCKER_BIN $*
	)
}

check-docker-machine () {
	# for patch stdio log, see https://cpolizzi.github.io/podman/enabling-qemu-cli-monitoring-and-logging.html
	if [[ "$(podman machine list --format json | jq -r '.[].Running')" == "false" ]]; then
		if [[ "$(podman machine list --format json | jq -r '.[].Starting')" == "true" ]]; then
			cfg=$(cat ${HOME}/.config/containers/podman/machine/qemu/podman-machine-default.json | jq '.Starting = false')
			echo "${cfg}" | tee ${HOME}/.config/containers/podman/machine/qemu/podman-machine-default.json
		fi
		podman machine start
	fi
}

docker () {
	(
		#export DOCKER_HOST=$(podman system connection list --format=json | jq -r '.[] | select(.Default) | .URI' | awk -F'/run' '{print $1}')
		export DOCKER_HOST=unix://${HOME}/.local/share/containers/podman/machine/podman.sock
		check-docker-machine
		podman $*
	)
}

docker-prune-all () {
	docker system prune --all --volumes --force
}

docker-buildx () {
	(
		check-docker-machine
		[[ "$(docker inspect buildkitd 2>/dev/null | jq '.[].State.Running')" != "true" ]] && \
			docker rm buildkitd -f && \
			docker run -d --name buildkitd --privileged docker.io/moby/buildkit:latest
		name=$1
		[ -z "$name" ] && name=$(basename "$(pwd)")
		[ -f "$name" ] && name=$(echo "${name//Dockerfile./}") && opts=(--opt filename=./$1)
		buildctl --addr=podman-container://buildkitd build \
			--frontend dockerfile.v0 \
			--local context=. \
			--local dockerfile=. \
			--export-cache type=inline \
			--output "type=docker,name=${name}" \
			${opts} \
		| podman load
	)
}
