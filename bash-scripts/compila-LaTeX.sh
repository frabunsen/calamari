#!/bin/bash

#check numbers of arguments
if [[ $# -lt 1 ]];then
echo "Missing {tex} file!"
        exit;
fi

NOME=$(basename ${1});
PERCORSO=$(dirname ${1});
LEN=${#NOME};
let POS=$LEN-4;
EXT=${NOME:$POS:4}
FIRST=${NOME:0:POS};

for i in `seq 1 3`;do 
     	pdflatex $NOME 2>&1 > /dev/null;
      	if [[ $i == 1 ]];then
	    	bibtex ${FIRST}.aux 2>&1 > /dev/null;
	fi; 
done

rm ${FIRST}.log > /dev/null 2>&1;
rm ${FIRST}.aux > /dev/null 2>&1;
rm ${FIRST}.blg > /dev/null 2>&1;
rm ${FIRST}.bbl > /dev/null 2>&1;
rm ${FIRST}.toc > /dev/null 2>&1;
rm ${FIRST}.out > /dev/null 2>&1;
rm ${FIRST}.spl > /dev/null 2>&1;
rm ${FIRST}.ptc > /dev/null 2>&1;
rm ${FIRST}.tdo > /dev/null 2>&1;
rm ${FIRST}.nav > /dev/null 2>&1;
rm ${FIRST}.snm > /dev/null 2>&1;
rm ${FIRST}.bst > /dev/null 2>&1;
rm ${FIRST}.pyg > /dev/null 2>&1;
echo "DONE!"
