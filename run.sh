#!/bin/bash

echo "Changing password to ${ROOT_PASSWORD}"
echo root:${ROOT_PASSWORD} | chpasswd

exec /usr/sbin/sshd -D
