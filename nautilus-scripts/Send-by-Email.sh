#!/bin/bash

recipients="name1
user1@email
name2
user2@email
name3
user3@email"

while read -r f
do
  # check if file and add to list
  if [ -f "$f" ]; then files+=( "$f" ); fi
done <<< "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"

if (( ${#files[@]}==0 ))  # nothing to send = exit
then
  exit
fi

# recipient
##r=$( zenity --list --title="Address book" --text="Select recipient" --column=name --column=address --print-column=2 <<< "$recipients" )
r=$( yad --list --title="Address book" --text="Select recipient" --column=name --column=address --separator='' --width=400 --height=300 --print-column=2 <<< "$recipients" )
# subject
s=$( yad --entry --title="Subject" --text="Enter subject" )
##s=$( zenity --entry --title="Subject" --text="Enter subject" )

if (( ${#files[@]}==1 ))  # 1 file
then
  mpack -s "$s" "${files[0]}" "$r"
elif (( ${#files[@]}>1 ))  # multiple files
then
  for(( i=0; i<${#files[@]}; i++ ))
  do
    mpack -s "$s (#$((i+1)))" "${files[$i]}" "$r"
  done
fi

exit


# sudo add-apt-repository ppa:webupd8team/y-ppa-manager
# sudo apt-get update
# sudo apt-get install yad
