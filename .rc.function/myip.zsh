#!/bin/bash

myip () {
	default_route_ip=$(yq '... comments = "" | ... style = ""' <(curl -sSL wc.sg))
	first_interface_ip=$(yq '... comments = "" | ... style = ""' <(curl --interface en0 -sSL wc.sg))
	if [[ "$default_route_ip" != "$first_interface_ip" ]]; then
		yq '.default = .ip-info | del(.ip-info)' <(echo "$default_route_ip")
		yq '.first-ip = .ip-info | del(.ip-info)' <(echo "$first_interface_ip")
	else
		yq '' <(echo "$default_route_ip")
	fi
}
