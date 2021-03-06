#!/bin/bash -ex

# customable enviroment variables
SSHUSER=oanhnn

# fixed enviroment variables
DEBIAN_FRONTEND=noninteractive

apt install -y docker.io

apt remove -y docker docker-engine docker.io containerd runc
apt update -y
apt install -y apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update -y
apt install -y docker-ce docker-ce-cli containerd.io
usermod -aG docker $SSHUSER

systemctl start docker
systemctl enable docker
