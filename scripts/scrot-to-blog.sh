#!/usr/bin/env bash

filemask=~/Pictures/Screenshots/scrot-*
blog_img_dir=~/projects/personal/tiniblog/static/images

unset -v latest
for file in $filemask; do
  [[ $file -nt $latest ]] && latest=$file
done

if [[ ! -z "$latest" ]]
then
  cp $latest $blog_img_dir
  echo -n "/images/$(basename $latest)"
fi
