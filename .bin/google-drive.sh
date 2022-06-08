#!/bin/bash -x
( DATE=$(date +'%Y-%m-%d-%H-%M-%S')
  echo $DATE beginning google drive mount attempt
 /usr/bin/google-drive-ocamlfuse -verbose -debug -headless ~/g
  echo $DATE after mount attempt
  df ~/g
) >/tmp/gd.log 2>&1


