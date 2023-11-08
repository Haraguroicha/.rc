#!/usr/bin/env zsh

ipa () {
	GEM=$(brew --prefix ruby@3.0)/bin/gem
	IPA=$("${GEM}" env | grep 'INSTALLATION DIRECTORY' | grep -v USER | awk -F: '{print $NF}' | xargs echo)/bin/ipa
	[[ -x "${GEM}" ]] && [[ -x "${IPA}" ]] && "${IPA}" "$@"
}
