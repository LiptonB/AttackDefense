#!/bin/sh

# sudo apt-get install auditd
# sudo yum install auditd

auditctl -l
echo "install rules?"
read ANS
if [ "$ANS" == "y" ]; then
  auditctl -a exit,always -F arch=x86_64 -S open
  auditctl -a exit,always -F arch=i386 -S open
fi
