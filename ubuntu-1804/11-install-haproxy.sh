#!/bin/bash -ex

# load environment variables
if [[ -f .env ]]; then
 source .env
fi

# fixed enviroment variables
DEBIAN_FRONTEND=noninteractive
SSH_USER=${SSH_USER:-"oanhnn"}
ES_VERSION=${ES_VERSION:-"6.7.0"}

#apt install -y software-properties-common
add-apt-repository ppa:vbernat/haproxy-1.9 -y

apt update -y
apt install -y haproxy

systemctl start haproxy
systemctl enable haproxy

ufw allow 80
ufw allow 443
