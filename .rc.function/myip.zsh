#!/bin/bash

myip () {
	yq '... comments = "" | ... style = ""' <(curl -sSL wc.sg)
}
