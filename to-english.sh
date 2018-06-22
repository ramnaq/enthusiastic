#!/bin/bash
for d in $1
do
cd "$d"
for f in *; do
    file=$(basename -- "$f")
    extension="${file##*.}"
    f_name="${file%.*}"
    en_name="$(echo "$f_name" | cut -d a -f 1)"
    num="$(echo "$f_name" | cut -d a -f 2 | head -c 2 | tail -c 2)"
    full_en_name="${en_name}${num}.${extension}"
    fst_letter=$(echo "${f_name}" | head -c 1)
    if [ $fst_letter == p ]
    then
        mv "$f" "$full_en_name"
    fi
done
done
