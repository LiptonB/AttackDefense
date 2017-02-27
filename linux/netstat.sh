#!/bin/sh

if [ `id -u` -ne "0" ]; then
  echo "Rerun as root?"
  sleep 2
fi

while true; do
  sudo netstat -neap --inet | less
  sleep 1
done
