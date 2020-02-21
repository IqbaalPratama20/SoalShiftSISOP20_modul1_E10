#!/usr/bin/bash
echo "Soal 1 a:"
reg=$(awk -F "\t" '{arr[$13]+=$21} END{n=asort(arr,min);for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}}; print ind[2]}' Sample-Superstore.tsv)
echo "$reg"
echo "Soal 1 b:"
sta=$(awk -F "\t" -v reg1=$reg '$13 ~ reg1 {arr[$11]+=$21} END{n=asort(arr,min);for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}}; for(c=1;c<=2;c++) print ind[c]}' Sample-Superstore.tsv)
echo "$sta"
echo "soal 1 c:"	
awk -F "\t" '$11 ~ /Texas/ {arr[$17]+=$21}$11 ~ /Illinois/ {arr[$17]+=$21}END{n=asort(arr,min);for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}};for(i=1;i<=10;i++){print ind[i]}}' Sample-Superstore.tsv
