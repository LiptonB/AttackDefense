#!/bin/sh

dir=$(dirname $0)
sudo apt-get clean
keys="$(sudo apt-key finger | grep fingerprint | sed 's/.*Key fingerprint = //')"
echo "$keys" | while read -r key; do
  if ! grep -q "$key" "$dir/apt-keys" </dev/null; then
    echo "$key not recognized"
  else
    echo "$key ok"
  fi
done
