#!/bin/bash
cd $1
for d in *; do
  cd "$d"
  for f in *; do
    file=$(basename -- "$f")
    extension="${file##*.}"
    f_name="${file%.*}"
	en_name="$(echo "$f_name" | cut -d a -f 1)"  # problema -> problem
	if [ $(echo "${f_name}" | head -c 1) == p ]
	then
	  num="$(echo "$f_name" | cut -d a -f 2 | head -c 2 | tail -c 2)"
	  mv "$f" "${en_name}${num}.${extension}"  # problema<i>.<ext> -> problem<i>.<ext>
	elif [ $(echo "${f_name}") == questoes ]
	then
	  mv "$f" questions.pdf	 # questoes.pdf -> questions.pdf
	fi
  done
  cd ..
done
