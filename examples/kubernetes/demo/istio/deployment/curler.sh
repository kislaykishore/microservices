#!/bin/bash

addr=`kubectl get svc -n ns5 | sed 1d |awk '{print $4}'`
port=`kubectl get svc -n ns5 | sed 1d |awk '{print $5}'`
IFS=':'
read -ra ADDR <<< "$port"
port=${ADDR[0]}
while true
do
  curl "http://$addr:$port"
  printf "\n"
  sleep 1
done
