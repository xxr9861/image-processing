#! /bin/bash

# reads a list of image file path and creates corresponding thumbs
# the file concerned is just absolute paths of image files and is supplied as an argument
#usage arguments
show_help(){

    cat <<EOF
 Usage: ${0##*/} [-h] 
 Reduce the size of image files like png and jpg

     -h          display this help and exit

EOF
 }

check_program_arguments(){
     is_this_null=$1
     if [ -z $is_this_null ]
     then
	 # ok, problem, there was no url file supplied
	 # echo out error message tell them to supply a url file
	 echo "I need a text file having full path of images in each line"
     else
	 if [ -f $is_this_null ]
	 then
	     #ok a file that exists has been supplied
	     create_thumbs	     
	     #	 parse_program_arguments $is_this_null
	 else
	     parse_program_arguments $is_this_null
	     fi
     fi
 }

 parse_program_arguments(){
 while getopts h: opt; do
     case $opt in
         h)
             show_help
             exit 0
             ;;
          *) echo "Invalid arguments"
             show_help >&2
             exit 1
             ;;
     esac
 done
# shift "$((OPTIND-1))"   # Discard the options and sentinel --
}

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

#create_thumbs $*


check_program_arguments $*
