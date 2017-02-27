#!/bin/sh
# Prints the level of sudo access for each user on the system

echo "sudo access for each user:"
getent passwd | cut -d':' -f1 | xargs -n1 sudo -l -U

echo
echo "UID 0 or GID 0 users:"
getent passwd | awk -F: '$3 == 0 || $4 == 0 { print $1 }'
getent group | awk -F: '$3 == 0 && $4 != "" { print $4 " (via group " $1 ")" }'
