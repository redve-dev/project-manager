#!/bin/bash

CLASS_NAME=$1

if [[ -d $CLASS_NAME ]]; then
	echo "The directory $CLASS_NAME already exist. Terminating"
	exit 1
fi

mkdir $CLASS_NAME
cp ../templates/cpp/class/* $CLASS_NAME/
cd $CLASS_NAME

# keep extension of each file, but change its actual name
for file in `ls`
do
	NEW_FILENAME=`echo $file | sed -e "s/MY_CLASS/$CLASS_NAME/g"`
	mv $file $NEW_FILENAME
	# change string "MY_CLASS in template, to the class name"
	sed -i -e "s/MY_CLASS/$CLASS_NAME/g" $NEW_FILENAME
done
