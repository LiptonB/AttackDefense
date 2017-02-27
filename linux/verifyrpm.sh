#!/bin/sh

PKG=$1

if [ -z "$PKG" ]; then
  echo "Usage: $0 <package or -a>"
  exit 1
fi

rpm -qV $PKG | awk ‘$2!=”c” {print $0}’
