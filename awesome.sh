#!/bin/sh

if [ $1 = '--help' ]; then
  echo Usage: $0
  echo First argument denotes the directory you want to list
  echo Second arguments denotes the size of file you want to filter in bytes
  echo Example: $0 [DIR] [SIZE]
  echo
  echo Invalid directory or file size will give you error so dont play around (please)
else
  echo dir: $1
  if [ -z $2 ]; then
    echo Error: no file size provided, use --help
  else
    echo Size: $2


    if [ 0 -gt $2 ]
      then
        echo Error: file size cannot be negative number: $2

      else
        if [ -d $1 ]
        then
          echo
          for f in `ls $1`; do

            size=`stat -c%s $1/$f`
            if [ $size -gt $2 ]
            then
              echo $f  $size  $1/$f
            fi

          done
          echo

          echo Listed all files in dir $1 whose size is greater than $2 bytes

        else
          echo "Error: check if that path exist: $1"
        fi

      fi

  fi
    fi
