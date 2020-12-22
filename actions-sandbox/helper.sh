#!/bin/sh

cwd=`dirname "$0"`
expr "$0" : "/.*" > /dev/null || cwd=`(cd "$cwd" && pwd)`

if [ $# -ne 1 ]
then
  filename=$(ls -1 $cwd/workflows | fzf)
fi


git add $cwd/workflows/$filename
cp -p $cwd/workflows/$filename $cwd/.github/workflows/$filename
git add $cwd/.github/workflows/$filename
git commit -m "Added $filename"
