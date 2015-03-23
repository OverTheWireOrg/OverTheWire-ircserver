#!/bin/bash

tmphn=$(hostname)
hn=${1:-$tmphn}

cd /opt/inspircd

if [ ! -e conf/servers/config-$hn.conf ];
then
    echo "Config for host $hn doesn't exist"
    exit 1
fi

cat conf/config-myname.conf.template | sed 's:#<define:<define:'|sed "s:this-server-name:$hn:" > conf/config-myname.conf
chmod go= conf/config-myname.conf
chown irc.irc conf/config-myname.conf

exit 0
