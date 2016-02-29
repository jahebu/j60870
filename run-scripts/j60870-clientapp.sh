#!/bin/bash

JARS_LOCATION="../build/libs"
MAIN_CLASS="org.openmuc.j60870.app.ClientApp"
SYSPROPS=""
PARAMS=""

SCRIPT_HOME=`dirname $0`

CLASSPATH=$(JARS=("$SCRIPT_HOME"/"$JARS_LOCATION"/*.jar); IFS=:; echo "${JARS[*]}")

for i in $@; do 
    if [[ $i == -D* ]]; then
	    SYSPROPS="$SYSPROPS $i";
    else
	    PARAMS="$PARAMS $i";
    fi
done

java $SYSPROPS -cp $CLASSPATH $MAIN_CLASS $PARAMS