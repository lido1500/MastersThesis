#!/bin/bash

while true ; do \
  inotifywait review/h264_rev.tex \
  && ( make rev diff clean ) \
done
