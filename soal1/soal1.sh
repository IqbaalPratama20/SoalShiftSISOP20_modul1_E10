#!/usr/bin/bash
echo "Soal 1 a:"
awk -F "\t" '{arr[$13]+=$21} END{n=asort(arr,min);for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}}; print ind[2]}' Sample-Superstore.tsv
echo "Soal 1 b:"
awk -F "\t" '$13 ~ /Central/ {arr[$11]+=$21} END{n=asort(arr,min);for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}}; print ind[1], ind[2]}' Sample-Superstore.tsv
echo "soal 1 c:"
awk -F "\t" '$11 ~ /Texas/ {arr[$17]+=$21}$11 ~ /Illinois/ {arr[$17]+=$21}END{n=asort(arr,min);for(i in arr){for(a=1;a<=n;a++){if(arr[i]==min[a])ind[a]=i}};for(i=1;i<=10;i++){print ind[i]}}' Sample-Superstore.tsv
