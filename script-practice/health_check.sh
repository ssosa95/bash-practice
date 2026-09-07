#!/bin/bash

disk_usage=$(df -h / | awk 'NR==2 {print $5}')  # TARGET PATH / ON REAL LINUX SYSTEMS, CHANGE TO /mnt/c/ FOR WSL
disk_usage_number=${disk_usage%\%}

if [ "$disk_usage_number" -gt 80 ]; then
    message1="WARNING: Disk usage is above 80%: ($disk_usage)."
else 
    message1="Disk usage is OK: ($disk_usage)."
fi

if ! systemctl is-active --quiet ssh; then
    systemctl restart ssh
    if [ $? -eq 0 ]; then
        message2="ssh was down, restart succeeded"
    else
        message2="ssh was down, restart FAILED (permission denied?)"
    fi
else 
    message2="ssh is running"
fi

echo "$(date): $message1 $message2" >> /home/user/health_check.log
