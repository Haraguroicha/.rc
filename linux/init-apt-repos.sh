#!/usr/bin/env zsh

## using `curl -fsSL https://github.com/Haraguroicha/.rc/raw/refs/heads/master/linux/init-apt-repos.sh | sudo bash` to run this script

export DEBIAN_FRONTEND=noninteractive

sed -i 's#//archive.ubuntu.com#//tw.archive.ubuntu.com#g' /etc/apt/sources.list
sed -i 's#//security.ubuntu.com#//tw.archive.ubuntu.com#g' /etc/apt/sources.list

sed -i 's#//archive.ubuntu.com#//tw.archive.ubuntu.com#g' /etc/apt/sources.list.d/ubuntu.sources
sed -i 's#//security.ubuntu.com#//tw.archive.ubuntu.com#g' /etc/apt/sources.list.d/ubuntu.sources

apt update
apt install --auto-remove -y software-properties-common apt-transport-https ca-certificates curl qemu-guest-agent
systemctl enable --now qemu-guest-agent
install -m 0755 -d /etc/apt/keyrings

add-apt-repository -y ppa:fujiapple/trippy
add-apt-repository -y ppa:rmescandon/yq
sed -E -i 's#Suites: (.*)noble([^$]*)#Suites: jammy#g' /etc/apt/sources.list.d/rmescandon-ubuntu-yq-noble.sources
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
sed -i 's# noble # jammy #g' /etc/apt/sources.list.d/ookla_speedtest-cli.list

apt install --auto-remove -yq iperf3
apt install --auto-remove -y tmux btop htop mtr trippy jq yq traceroute iputils-ping speedtest fping

# docker-ce
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install --auto-remove -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
[ -n "${SUDO_USER}" ] && usermod -aG docker "$SUDO_USER"
