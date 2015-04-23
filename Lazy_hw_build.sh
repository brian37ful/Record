#!/bin/bash
# Program:
#   In order to build the god damn OS homework
# History:
# 2015/4/23  first release  Author by Brian37ful

test -e dir_list && rm dir_list
test -e Result && rm Result
ls > dir_list

while read string
do
    test -d $string || continue
    cd $string
    
    echo "\033[34m Building in $string  \033[0m"
    g++ *.c* && echo "$string Successful" >> ../Result && cd .. && continue
    echo "$string Failed" >> ../Result
    cd ..
done < dir_list
exit 1
