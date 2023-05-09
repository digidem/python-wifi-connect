#!/usr/bin/env

# Import env variables
. .env_vars

file=firstboot

if [ ! -e "$file" ] ; then
    echo "First run!"
    echo "================================"
    echo "Adding to /etc/hosts"
    sed -i "192.168.42.1  kit.com edt.com edt.net edt.local kitdt.com kitdt.net kit kitdt edt" /etc/hosts
    touch "$file"
fi

if [ ! -w "$file" ] ; then
    echo "Hosts already added"
    exit 1
fi


# Execute Python script
exec python3 -u run.py
