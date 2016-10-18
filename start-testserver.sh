#!/bin/bash

/usr/bin/docker run --rm --name testirc1.overthewire.org -p 16697:6697 -p 17029:7029 -v /usr/src/OverTheWire-ircserver/inspircd-config:/opt/inspircd/conf -v /usr/src/OverTheWire-ircserver/inspircd-secrets:/opt/inspircd-secrets inspircd /launch.sh testirc1 &
sleep 1
/usr/bin/docker run --rm --name testirc2.overthewire.org -p 26697:6697 -p 27029:7029 -v /usr/src/OverTheWire-ircserver/inspircd-config:/opt/inspircd/conf -v /usr/src/OverTheWire-ircserver/inspircd-secrets:/opt/inspircd-secrets --link testirc1.overthewire.org:testirc1.overthewire.org inspircd /launch.sh testirc2 &

