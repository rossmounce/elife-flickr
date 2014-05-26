#!/bin/bash
# MUST REMOVE/REPLACE ALL APOSTRPHES from *caps.txt files before running this
# find . -type f -name "*caps.txt" | sed -i  's/\x27/ /g' *caps.txt
# Turning on the nullglob shell option
shopt -s nullglob

# Make list of all subfolders in working directory, save as pwd.txt
find * -maxdepth 0 -type d -exec bash -c "cd \"{}\"; pwd" \;  > pwd.txt

# Loop through pwd cd'ing into each directory then pdftotext all PDFs within each subdirectory
for i in $(cat pwd.txt); do
  echo "$i"
  cd $i 

NUMOFLINES=$(wc -l < *caps.txt)
CAPSFILE=$(ls *caps.txt)
IMAGES=(./*.jpg)
#echo $NUMOFLINES
#echo ${IMAGES[0]}
#echo ${IMAGES[1]}

index=0
while read line ; do
	echo "$index"
	../doexif.sh ${IMAGES[$index]} "$line"
	#cmd="exiftool -xmp:description='$line' -E ${IMAGES[$index]}"
	#eval "$cmd" 
        #exiftool -xmp:description='$line' -E ${IMAGES[$index]}"
	let "index++"
done < "$CAPSFILE"  

	done

