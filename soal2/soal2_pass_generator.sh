#!/bin/bash

if [ ! -e $1 ]
    then
        c=$1;
        if [[ $c =~ [0-9] ]]
            then
                echo "Input contain number"
        else
            c+=".txt";
            NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)
            echo $NEW_UUID >> $c
        fi    
fi        
