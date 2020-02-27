#!/bin/bash
counterken=0
counterdup=0
for (( i=1; i<=28; i++ ))
do
	wget "https://loremflickr.com/320/240/cat" -O /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg 2>&1 | tee >> /home/iqbaal/praktikum1/log/wget.log
	cat /home/iqbaal/praktikum1/log/wget.log | grep Location: | tail -1 | awk '{print $2}' >> /home/iqbaal/praktikum1/log/location.log
	counterken=$(ls /home/iqbaal/kenangan/ | awk -F "_" '{print $2}'| sort -n | tail -1 | awk -F "." '{print $1}')
	counterdup=$(ls /home/iqbaal/duplicate/ | awk -F "_" '{print $2}' | sort -n | tail -1 | awk -F "." '{print $1}')
	if [[ -z $counterken ]]
		then
		counterken=0
		mv /home/iqbaal/praktikum1/bulk_gambar/pdkt_kusuma_$i.jpg /home/iqbaal/kenangan/kenangan_1.jpg
	else
		loc=$(cat /home/iqbaal/praktikum1/log/location.log | awk '{print $0}' | tail -1)
		img_count=$(awk -v locate=$loc '{arr[$locate]++} END{print arr[$locate]}' /home/iqbaal/praktikum1/log/location.log)
			if [ $img_count -gt 1 ] 
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
	fi		
done
cat /home/iqbaal/praktikum1/log/wget.log > /home/iqbaal/praktikum1/log/wget.log.bak
