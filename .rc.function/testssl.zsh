#!/bin/bash

testssl() {
	docker run --rm -ti drwetter/testssl.sh --warnings off --parallel --wide --show-each --color 3 --hints --full $*
}
