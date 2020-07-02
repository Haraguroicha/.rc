#!/bin/bash

i () {
	id="$1"
	name="$2"
	echo "Install for \`$name\` (\`$id\`) ..."
	mas install $id
}

i 638161122	"YubiKey Personalization Tool"
i 425264550	"Blackmagic Disk Speed Test"
i 539883307	"LINE"
i 425424353	"The Unarchiver"
i 1037126344	"Apple Configurator 2"
i 1295203466	"Microsoft Remote Desktop"
#i 803453959	"Slack"
#i 747648890	"Telegram"
i 409203825	"Numbers"
i 409183694	"Keynote"
i 409201541	"Pages"
i 497799835	"Xcode"
