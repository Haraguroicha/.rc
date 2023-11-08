#!/usr/bin/env zsh

arch_brew () {
	arch -arch x86_64 "/usr/local/bin/brew" "$@"
}

brew64 () {
	arch_brew "$@"
}

brew86 () {
	arch_brew "$@"
}

export WINE=$(brew86 --prefix game-porting-toolkit)/bin/wine64
gpt () {
	(
		export WINEPREFIX=$HOME/.wine-win10
		[[ ! -d "${WINEPREFIX}" ]] && mkdir -p "${WINEPREFIX}"
		"$WINE" "$@"
	)
}
steam () {
	(
		export WINEPREFIX=$HOME/.wine-win10
		cd "$WINEPREFIX/drive_c/Program Files (x86)/Steam/"
		MTL_HUD_ENABLED=1 WINEESYNC=1 gpt steam.exe -allosarches -cef-force-32bit -cef-in-process-gpu -no-cef-sandbox
	)
}
