#!/bin/sh

hn=$1
cp /opt/inspircd/conf/inspircd.conf /tmp/inspircd.conf
sed -i "s:MYHOSTNAME:$hn:g" /tmp/inspircd.conf
/opt/inspircd/bin/inspircd --nofork --config /tmp/inspircd.conf
