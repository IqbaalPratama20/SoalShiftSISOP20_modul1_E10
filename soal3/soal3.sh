#!/bin/bash
counterken=0
counterdup=0
flag=1
for (( i=1; i<=28; i++ ))
do
	wget "https://loremflickr.com/320/240/cat" -O /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg 2>&1 | tee >> /home/iqbaal/praktikum1/log/wget.log

	counterken=$(ls /home/iqbaal/kenangan/ | awk -F "_" '{print $2}'| sort -n | tail -1 | awk -F "." '{print $1}')
	counterdup=$(ls /home/iqbaal/duplicate/ | awk -F "_" '{print $2}' | sort -n | tail -1 | awk -F "." '{print $1}')
# echo $counterken

	if [[ -z $counterken ]]
		then
		counterken=0
		mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/kenangan/kenangan_1.jpg
	else
		echo $counterken
		for (( a=1; a<=$counterken; a++ ))
		do	 
			if [ diff "home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg" "/home/iqbaal/kenangan/kenangan_$a.jpg" ] 
				then
					if [[ -z $counterdup ]]
					then
						mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/duplicate/duplicate_1.jpg
					else
						mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/duplicate/duplicate_$(($counterdup+1)).jpg
					fi
			else
				mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/kenangan/kenangan_$(($counterken+1)).jpg
			fi
		done
	fi		
done
cp /home/iqbaal/praktikum1/log/wget.log > /home/iqbaal/praktikum1/log/wget.log.bak
