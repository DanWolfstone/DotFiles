#!/bin/bash
ping -q -c1 google.com &>/dev/null && online=1 || offline=1

while [ $offline ]
do
    ping -q -c1 google.com &>/dev/null && online=1 || offline=1
    if [ $online ]; then
        break
    fi
done

echo "online"
cd ~ && echo "Home"
rclone mount DesX: ~/DesX/ --daemon --log-file ./RC_DesX.log && echo "Mounted DesX"
rclone mount SchoolDR: ~/School/ --daemon --log-file ./RC_School.log && echo "Mounted School Dr"
