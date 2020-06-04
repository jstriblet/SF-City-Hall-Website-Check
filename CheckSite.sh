#!/bin/bash

cd ~/Documents/CS/SFEventsChange

wget -o Log-File -O one-hour-weddings-curr http://sfcityhallevents.org/one-hour-weddings

file1=`cat one-hour-weddings-curr`
file2=`cat one-hour-weddings-prev`

if [ "$file1" = "$file2" ]; then
	#echo "files are equal"
else
  cat Notification-Email | /usr/sbin/sendmail -t
	#echo "files are not equal"
fi
