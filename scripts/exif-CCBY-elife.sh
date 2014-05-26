#!/bin/bash
# Usage: dive into each subdirectory in working directory and wget the *jpg.txt file in each

# Turning on the nullglob shell option
shopt -s nullglob

# Make list of all subfolders in working directory, save as pwd.txt
find * -maxdepth 0 -type d -exec bash -c "cd \"{}\"; pwd" \;  > pwd.txt

# Loop through pwd cd'ing into each directory then pdftotext all PDFs within each subdirectory
for i in $(cat pwd.txt); do
  cd $i 
  for f in *.jpg
	do
	echo "stamping $f"
        exiftool -xmp:rights='Creative Commons Attribution License' -E $f
	exiftool -xmp:publisher='eLife' -E $f
	done
done
