#!/usr/bin/env bash

NUM_COMMITS=$((1 + $RANDOM % 4))
CUR_DATE=$(date -I -u)

git config user.name  "Jim Craveiro"
git config user.email "jim.craveiro@gmail.com"
echo -n $CUR_DATE" " >> ./record

I=1
while [ $I -le $NUM_COMMITS ]
do
    echo -n "|" >> ./record
    
    if [ $I -eq $NUM_COMMITS ]
    then
        echo >> ./record
    fi
    
    git add record
    git commit -m "$CUR_DATE - Totally legit commit $I/$NUM_COMMITS"
    
    I=$(($I + 1))
done

git push origin main
