#!/bin/bash

inode=$(stat -c '%i' "$1")
fs=$(df  --output=source "$1"  | tail -1)
crtime=$(sudo debugfs -R 'stat <'"${inode}"'>' "${fs}" 2>/dev/null | 
grep -oP 'crtime.*--\s*\K.*')
times=$(echo $crtime | cut -d' ' -f4)
hours=$(echo $times | cut -d':' -f1)

filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# echo $filename
conv_hours=$((10#$hours))

kamusa=('a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z')
kamusb=('A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z')
tempone=${kamusa[$conv_hours]}
tempones=${kamusa[$conv_hours-1]}
tumpone=${kamusb[$conv_hours]}
tumpones=${kamusb[$conv_hours-1]}

name_file="$(echo "$filename" | tr [a-z] ["$tempone"-za-"$tempones"] | tr [A-Z] ["$tumpone"-ZA-"$tumpones"])"
name_file+=".txt"
# echo $1
mv $1 $name_file  