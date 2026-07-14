#!/bin/bash

echo "===Disk Usage Report==="
df -h
usage=$(df -h | grep "/" | awk '{print $6}' | tr -d '%')
if (( usage > 80 )); then
    echo "Warning: disk usage is at ${usage}%"
else
    echo "Disk usage is at ${usage}% — OK"
fi