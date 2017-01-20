#!/bin/bash

## Transassial multislice image creator
# v0.1	[22.04.2016]
#
# Requires xmedcon package: 
#	sudo apt-get install xmedcon

## USAGE: 
#	./multislice.sh $IMG 	
#	./multislice.sh $IMG ${IMG%.*}.png	
# IMG = a NiFTY (.nii) image 


#----------------------------------------------------------------------------
DEBUG=1;        # executes
#DEBUG=""       # a ``dry-run``
function debug () { if [[ -z $DEBUG ]]; then echo $@; else $@; fi; }

function linspace () {
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Error: missing arguments."
    echo "Usage: linspace XMIN XMAX NSTEPS"; exit 1
fi

XMIN="$1"
XMAX="$2"
NSTEPS="$3"
for i in $(seq 0 1 $((NSTEPS - 1))); do
    echo | awk -v i=$i -v XMIN=$XMIN -v XMAX=$XMAX -v NSTEPS=$NSTEPS \
                          '{printf "%.8f ", XMIN + 1.*i/(NSTEPS-1)*(XMAX-XMIN)}'
done
}

#----------------------------------------------------------------------------


if [[ $# -eq 1 ]]; then
	TPD=$(mktemp -d); echo TPD=$TPD
	TPF=$(mktemp -p $TPD); echo TPF=$TPF
elif [[ $# -eq 2 ]]; then
	echo "Writing output on $2 image file"
	TPD=$(mktemp -d); echo TPD=$TPD
	TPF=$2; echo TPF=$2
else
	echo "Usage: <0> file"
	PAR_ERR=65
	exit $PAR_ERR
fi

OLDIR=$(dirname $1)
[[ "A"$OLDIR != "A."  ]] && : || OLDIR=$(pwd)
echo OLDIR=$OLDIR

IMG=$(basename $1);	echo IMG=$IMG
debug cp $IMG $TPD
debug cd $TPD

NSLICES=$(medcon -f $IMG |grep -E "dim\[8\]"|grep -v pix|awk -F"=" '{print $2}'|awk '{print $4}'); echo NSLICES=$NSLICES
EDGE=$(echo "sqrt($NSLICES)" |bc)
let SQUARE=$EDGE*$EDGE
let END=$SQUARE+$EDGE-1

echo "medcon .."
echo "medcon -e $EDGE:1:$END -f $IMG -c png"
debug medcon -e $EDGE:1:$END -f $IMG -c png

for ii in `seq 1 $EDGE`
do
	let CHUNK=$ii*$EDGE
	SEQUEN=$(ls m000-${IMG%.*}-000*|head -n $CHUNK |tail -n $EDGE| tr -s '\n' ' ')
	echo "convert $ii .."
	debug convert $SEQUEN +append hz${ii}.png
done
SEQUEN=$(ls hz*.png)
echo "convert final .."
debug convert $SEQUEN -append $TPF


echo "copying out .."
debug cp $TPF $OLDIR
echo "get back .."
debug cd $OLDIR
