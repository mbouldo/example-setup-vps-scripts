#!/bin/bash -ex

# customable enviroment variables
GITLABUSER=oanhnn
SSHUSER=oanhnn

addgroup dev
adduser --disabled-password --ingroup dev $SSHUSER
usermod -aG sudo $SSHUSER

mkdir -p /home/$SSHUSER/.ssh
wget -q -O /home/$SSHUSER/.ssh/authorized_keys https://gitlab.com/$GITLABUSER.keys
chown -R $SSHUSER:dev /home/$SSHUSER/.ssh
chmod 755 /home/$SSHUSER/.ssh
find /home/$SSHUSER/.ssh -type d -exec chmod 755 {} \;
find /home/$SSHUSER/.ssh -type f -exec chmod 600 {} \;
