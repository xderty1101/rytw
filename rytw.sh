#!/bin/bash

echo pick resolution\/audio format thing? \(y\/N\)
read userChoice
if [ "$userChoice" = "Y" ] || [ "$userChoice" = "y" ]
then
	echo \(1\)Play \| \(2\)Download
	read userChoice
	if [ "$userChoice" = "1" ] || [ "$userChoice" = "P" ] || [ "$userChoice" = "p" ]
	then
		echo -e "you chose Play\npls put 1 link in"
		read userChoice
		yt-dlp -F $userChoice
		echo -e "\n pick video+audio or smth idk, space with + eg. 123+456"
		read userChoiceF
		yt-dlp -f $userChoiceF -o - $userChoice | mpv -
	elif [ "$userChoice" = "2" ] || [ "$userChoice" = "D" ] || [ "$userChoice" = "d" ]
	then
		echo -e "you chose Download\n(1)Audio | (2)Video"
		read userChoice
		if [ "$userChoice" = "1" ] || [ "$userChoice" = "A" ] || [ "$userChoice" = "a" ]
		then
			echo -e "put in 1 or more links\nSeparate with spaces"
			read userChoice
			yt-dlp -F $userChoice
			echo -e "\n pick video+audio or smth idk, space with + eg. 123+456"
			read userChoiceF
			yt-dlp -f $userChoiceF -x $userChoice
		elif [ "$userChoice" = "2" ] || [ "$userChoice" = "V" ] || [ "$userChoice" = "v" ]
		then
			echo -e "put in 1 or more links\nSeparate with spaces"
			read userChoice
			yt-dlp -F $userChoice
			echo -e "\n pick video+audio or smth idk, space with + eg. 123+456"
			read userChoiceF
			yt-dlp -f $userChoiceF $userChoice
		else
			echo dumb fuck put 1 or 2
		fi
	else
		echo dumb fuck put 1 or 2
	fi
elif [ "$userChoice" = "N" ] || [ "$userChoice" = "n" ] || [ "$userChoice" = "" ]
then
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
else
	echo fuck off
fi
