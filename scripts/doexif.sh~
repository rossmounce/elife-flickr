#!/bin/bash
docmd="exiftool -h -charset utf8 -xmp:description='Source $(cat doi.doi) $2'  $1"
eval "$docmd"
docmdtwo="exiftool -h -charset utf8 -xmp:creator='$(cat authors.txt)'  $1"
eval "$docmdtwo"
