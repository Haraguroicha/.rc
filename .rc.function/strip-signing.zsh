#!/usr/bin/env zsh

strip-signing () {
	openssl smime -inform DER -verify -in $1 -noverify -out $1
}
