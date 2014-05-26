#!/bin/bash
for f in *.html
	do
	echo "started on $f"
	STEM=$(echo $f | sed 's/.....$//g' )
	mkdir $STEM
	cmdb="grep 'citation_author\"' $f | sed 's/<meta name=\"citation_author\" content=\"//g' | sed 's/\" \/>//g' > ./$STEM/authors.txt"
	eval $cmdb
	done
