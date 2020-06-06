#!/bin/bash

cd ~/Documents/CS/SFEventsChange

wget -o Log-File -O one-hour-weddings-curr http://sfcityhallevents.org/one-hour-weddings

p1=`head -n 724 one-hour-weddings-curr | tail -n 9`
p2=`head -n 724 one-hour-weddings-prev | tail -n 9`

diff=`sdiff -s <(echo $p1) <(echo $p2)`

if [ "$p1" = "$p2" ]; then
	echo "Paragraphs are the same."
else
	cat Notification-Email | /usr/sbin/sendmail -t
	echo "Paragraphs are not the same."
fi
