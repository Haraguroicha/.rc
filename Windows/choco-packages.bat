choco install microsoft-build-tools visualstudio2019buildtools visualstudio2022community -y --not-silent --package-parameters "--allWorkloads --includeRecommended --includeOptional --passive --locale en-US"
choco install googlechrome 7zip git googledrive sysinternals winrar vscode wget microsoft-windows-terminal curl chocolateygui procexp 1password cmder iperf3 vcredist-all telegram psexec speedtest steam git-lfs oh-my-posh wireguard winbox defraggler pstools desktopinfo partition-assistant-standard jq yq golang strawberryperl rustup.install -y

refreshenv

vcpkg install openssl:x64-windows-static-md openssl:x86-windows-static-md openssl:arm64-windows-static-md openssly:x64-windows openssly:x86-windows openssly:arm64-windows

vcpkg integrate install
