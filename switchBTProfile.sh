#!/bin/bash

headsetaddress="AA:CC:EE:FF:HH:JJ" #change this to your headset address

echo "Start Monitoring"

while [ true ]
do
	if [ $(bluetoothctl info $headsetaddress |grep "Connected: yes"|wc -l) -gt 0 ] #headset connected. Should have a better way to recognize if a bt headset is connected
	then
		echo "Headset $headsetaddress connected"

		cardIndexes=$(pactl list cards|grep "Card #") 
		echo $cardIndexes
		btindex=${cardIndexes: -1} #bluetooth card has been observed to be the last index. Somehow a new card index is assigned everytime headset is reconnected.
		echo "Headset connected to card $btindex"

		if [ $(ps -ef|grep zoom|wc -l) -gt 1 ] #zoom is running. Can change this to capture other conference apps like MS Teams, Slack  
		then
			echo "Conference app is running"
			if [ $(pactl info|grep handsfree|wc -l) -eq 0 ] #switch to handsfree profile if currently not handsfree
			then
				echo "Changing to handsfree profile"
				pactl set-card-profile $btindex handsfree_head_unit
				echo "Changed to handsfree profile"
			fi
		else #zoom is not running
			echo "Conference app is not running"
			if [ $(pactl info|grep a2dp|wc -l) -eq 0 ] #switch to a2dp if currently not a2dp
			then
				echo "Changing to a2dp profile"
				pactl set-card-profile $btindex a2dp_sink
				echo "Changed to a2dp profile"
			fi
		fi
	fi
	sleep 15 #change to smaller number to be more responsive
done
