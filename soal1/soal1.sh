#!/usr/bin/bash
echo "Soal 1 a:"
reg=$(awk -F "\t" 'NR > 1 {arr[$13]+=$21} END{n=asort(arr,min);for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}}; print ind[1]}' Sample-Superstore.tsv)
echo "$reg"
echo "Soal 1 b:"
sta1=$(awk -F "\t" -v reg1=$reg '$13 ~ reg1 {arr[$11]+=$21} END{n=asort(arr,min);for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}}; print ind[1]}' Sample-Superstore.tsv)
sta2=$(awk -F "\t" -v reg1=$reg '$13 ~ reg1 {arr[$11]+=$21} END{n=asort(arr,min);for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}}; print ind[2]}' Sample-Superstore.tsv)
echo "$sta1"
echo "$sta2"
echo "soal 1 c:"	
awk -F "\t" -v state1=$sta1 -v state2=$sta2 '$11 ~ state1 {arr[$17]+=$21}$11 ~ state2 {arr[$17]+=$21}END{n=asort(arr,min);for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}};for(i=1;i<=10;i++){print ind[i]}}' Sample-Superstore.tsv
