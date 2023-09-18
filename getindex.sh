#!/bin/bash

file="repos.txt"
curlglob="{ilisite,ilimodels,ilidata}.xml"

while read -r line
do
  [[ "$line" =~ (^#.*$)|(^\s*$) ]] && continue
  [[ "$line" =~ (^https?://)([^/]+) ]] && folder="${BASH_REMATCH[2]}"
  [[ "$folder" =~ ([[:alnum:]-]+)\.([[:alnum:]]+)$ ]] && folder="${BASH_REMATCH[2]}.${BASH_REMATCH[1]}"
  curl "$line$curlglob" -o "$folder/#1.xml" --create-dir 
done < $file
