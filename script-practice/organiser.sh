#!/bin/bash

echo "Welcome to the File Organizer."
if [ -z "$1" ]; then
	echo "Please provide a folder path."
	exit 1
else
	if [ -d "$1" ]; then
		echo "Folder exists."
	else
		echo "Folder doesn't exist. Please enter a valid folder."
		exit 1
	fi
fi

for file in "$1"/*; do
	extension="${file##*.}"
	case "$extension" in
		pdf)
			mkdir -p "$1/pdf_files"
			mv "$file" "$1/pdf_files/"
			echo "Moved $file to pdf_files/"
			;;
		sh)
			mkdir -p "$1/bash_scripts"
			mv "$file" "$1/bash_scripts/"
			echo "Moved $file to bash_scripts/"
			;;
		csv)
			mkdir -p "$1/excel_sheets"
			mv "$file" "$1/excel_sheets/"
			echo "Moved $file to excel_sheets/"
			;;
		txt)
			mkdir -p "$1/text_files"
			mv "$file" "$1/text_files/"
			echo "Moved $file to text_files/"
			;;
		png|jpg)
			mkdir -p "$1/images"
			mv "$file" "$1/images/"
			echo "Moved $file to images/"
			;;
		py)
			mkdir -p "$1/python_scripts"
			mv "$file" "$1/python_scripts/"
			echo "Moved $file to python_scripts/"
			;;
		*)
			mkdir -p "$1/invalid_extension"
			mv "$file" "$1/invalid_extension/"
			echo "$file had an atypical extension, please check $file. Moved $file to invalid_extension/"
			;;

	esac
done