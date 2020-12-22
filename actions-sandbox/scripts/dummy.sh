#!/bin/bash

if [ $# -ne 1 ]
then
    echo "USAGE: $1 <cmd>"
    exit 1;
fi

CMD="$1"
c=0
while true;
do
    echo -n "try $c - "
    echo $($CMD)
    (( c++ ))
    sleep 1
done

echo "Completed!!!"
