#!/bin/bash
#sudo mount -a

for f in /mnt/share/DWSG10/Music/CubeCallRecorder/All/*.amr
do
	ffmpeg -i $f -ar 22050 $f.mp3
done
