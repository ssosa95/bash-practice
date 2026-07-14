#!/bin/bash

read -p "Enter a filename: " filename

if [ -f "$filename" ]; then 
	echo "$filename exists."

else
	echo "Filename does not exist."
fi