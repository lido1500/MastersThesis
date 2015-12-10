#!/bin/bash

while true ; do \
  inotifywait review/resultats_rev.tex \
  && ( make rev diff clean ) \
done
