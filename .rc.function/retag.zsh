#!/bin/bash

retag() {
	docker pull $1
	docker tag $1 $2
	docker push $2
}

retagv2() {
	export COMPOSE_BASE_YAML=$(cat <<YAML
version: '2.3'
services:

YAML
)
	export COMPOSE_FROM_YAML=$COMPOSE_BASE_YAML
	export COMPOSE_TO_YAML=$COMPOSE_BASE_YAML
	export RETAGGING_LIST=""
	while [ -n "$1" ]
	do
		if [ -z "$2" ]; then
			echo "you need to specified a target image to retag"
			return 1
		fi
		export IMAGE_FROM=$1
		export IMAGE_TO=$2
		shift; shift;
		export SERVICE_NAME=$(echo "${$(echo "${IMAGE_TO##*/}")%:*}")
		export COMPOSE_FROM_YAML=$(cat <<YAML
$COMPOSE_FROM_YAML
  $SERVICE_NAME:
    build: .
    image: $IMAGE_FROM
YAML
)
		export COMPOSE_TO_YAML=$(cat <<YAML
$COMPOSE_TO_YAML
  $SERVICE_NAME:
    build: .
    image: $IMAGE_TO
YAML
)
		export RETAGGING_LIST=$(cat <<LINE
$RETAGGING_LIST
$IMAGE_FROM $IMAGE_TO
LINE
)
	done

	echo -ne "Pulling from this compose file:\n$COMPOSE_FROM_YAML\n\n"
	echo "$COMPOSE_FROM_YAML" | docker compose --ansi=always -f - pull

	while read -r line;
	do
		[ -z "$line" ] && continue
		echo $line | awk '{printf "tagging \033[34m"$1"\033[0m to \033[34m"$2"\033[0m: "}'
		echo $line | xargs docker tag
		if [ "$?" = "0" ]; then
			echo -e "\033[32mdone\033[0m"
		else
			echo -e "\033[31mfail\033[0m"
			return 127
		fi
	done <<<"$RETAGGING_LIST"
	echo ""

	echo -ne "Push from this compose file:\n$COMPOSE_TO_YAML\n\n"
	echo "$COMPOSE_TO_YAML" | docker compose --ansi=always -f - push
}
