#!/bin/bash -ex

# customable enviroment variables
HOSTNAME=example-svr

# fixed enviroment variables
DEBIAN_FRONTEND=noninteractive

# set hostname
hostnamectl set-hostname ${HOSTNAME}

# set locale
localectl set-locale LANG=en_US.UTF-8 LANGUAGE="en_US:en"

# set timezone
timedatectl set-timezone Asia/Ho_Chi_Minh

# update
apt update -y
apt upgrade -y
apt autoremove -y
apt install -y git wget curl gcc g++ make ca-certificates software-properties-common gnupg-agent

# firewall
ufw allow from 192.168.1.0/24 to any port 22
ufw enable
