#!/bin/bash
set -x
if [ $# != 2 ]
then
  echo "Usage:
    MakeGif.sh InputFile.vid OutputFile.gif"
  exit
fi

exec ffmpeg -i "$1" -r 10 -vf scale=320:-1 -f image2pipe -vcodec ppm - | convert -delay 5 -loop 0 - "$2"
