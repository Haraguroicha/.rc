#!/bin/bash

[[ $(where mas > /dev/null && echo $? || echo $?) -eq 0 ]] || (echo "mas not found, please install by \`brew install mas\` first" && exit 1)

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
i 409907375	"Apple Remote Desktop"
i 462054704	"Microsoft Word"
i 462058435	"Microsoft Excel"
i 462062816	"Microsoft PowerPoint"
i 985367838	"Microsoft Outlook"
i 1295203466	"Microsoft Remote Desktop"
i 1153157709	"Speedtest by Ookla"
i 494803304	"WiFi Explorer"
i 411680127	"WiFi Scanner"
#i 803453959	"Slack"
#i 747648890	"Telegram"
i 409203825	"Numbers"
i 409183694	"Keynote"
i 409201541	"Pages"
i 497799835	"Xcode"
