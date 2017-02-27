#!/bin/sh

echo "This script makes changes to cron jobs. Proceed? [y/n]"
read ans
if [ "$ans" != "y" ]; then
  exit 0
fi

for svc in crond cron atd anacron; do
  sudo service $svc stop
done

for tab in /etc/cron.{hourly,daily,weekly,monthly}/*; do
  echo "Disabling ${tab}"
  sudo sed -i '1 a exit 0' $tab
done

for tab in /etc/crontab /etc/cron.d/*; do
  echo "Disabling ${tab}"
  sudo sed -i '2,$ s/^/# /' $tab
done
