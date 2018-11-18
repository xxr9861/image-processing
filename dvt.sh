#! /bin/bash

# reads a list of image file path and creates corresponding thumbs
# the file concerned is just absolute paths of image files and is supplied as an argument

counter=1000
create_thumbs(){
while read line 
do 
#echo $line

/usr/bin/convert -define jpeg:size=550x150 "$line" -strip -thumbnail 700x300 ./thumb$counter.jpg

# this is cryptic for me but works

counter=$(expr $counter + 1)
done
}<$1

create_thumbs $*


