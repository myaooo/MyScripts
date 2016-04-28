#!/bin/sh 

# newsource.sh
# source file generating script
# author: Ming Yao
# 2016-04-11

# Usage:
# bash newsource.sh filename

declare -A comments=([python]="#" [c]="//" [shell]="#")
declare -A languages=( [py]=python [cpp]=c [h]=c [sh]=shell)
language="Unkown"

filename="$1"

write_comments(){
  _fname="$1"
  _cmt="$2"
  _current_date=`date +%Y-%m-%d`
  _author="Ming Yao"
  echo "${_cmt}" >> ${_fname}
  echo "${_cmt} ${_fname}" >> ${_fname}
  echo "${_cmt} Author: ${_author}" >> ${_fname}
  echo "${_cmt} Created at: ${_current_date}" >> ${_fname}
  echo "${_cmt}" >> ${_fname}
}

if [ -f "$filename" ]; then
  # Already have file
  echo "$filename existed."
elif [ x"$filename" = x ]; then
  echo "Please input a file name"
else
  # create file
  touch "$filename"
  # analyzing file type
  filetype="${filename##*.}"
  for suffix in ${!languages[*]}
  do
    if [[ $filetype == $suffix ]]; then
      language="${languages[$filetype]}"
      break
    fi
  done
  if [[ $langauge == "Unknown" ]]; then
    echo "Unknown file suffix type."
  else
    comment=${comments[$language]}
    # writing comments lines
    write_comments "$filename" "$comment"
    echo "$filename created."
  fi
fi



