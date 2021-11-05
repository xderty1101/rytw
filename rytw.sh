#!/bin/bash

echo \(1\)Play \| \(2\)Download

read userChoice

if [ "$userChoice" = "1" ] || [ "$userChoice" = "P" ] || [ "$userChoice" = "p" ]
then
	echo -e "you chose Play\npls put 1 link in"
	read userChoice
	yt-dlp -o - $userChoice | mpv -
elif [ "$userChoice" = "2" ] || [ "$userChoice" = "D" ] || [ "$userChoice" = "d" ]
then
	echo -e "you chose Download\n(1)Audio | (2)Video"
	read userChoice
	if [ "$userChoice" = "1" ] || [ "$userChoice" = "A" ] || [ "$userChoice" = "a" ]
	then
		echo -e "put in 1 or more links\nSeparate with spaces"
		read userChoice
		yt-dlp -x --audio-format mp3 $userChoice
	elif [ "$userChoice" = "2" ] || [ "$userChoice" = "V" ] || [ "$userChoice" = "v" ]
	then
		echo -e "put in 1 or more links\nSeparate with spaces"
		read userChoice
		yt-dlp -f mp4 $userChoice
	else
		echo dumb fuck put 1 or 2
	fi
else
	echo dumb fuck put 1 or 2
fi
