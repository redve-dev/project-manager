#!/bin/bash

function CreatePythonProject(){
	echo -n "Enter project name: "
	read PROJECT_NAME
	if [[ ! -d $PROJECT_NAME ]]; then
		cp -r ../templates/python/new_project $PROJECT_NAME
		break
	else
		echo "The directory already exist. Aborting"
	fi
}

function CreateCPPProject(){
	echo -n "Enter project name: "
	read PROJECT_NAME
	if [[ ! -d $PROJECT_NAME ]]; then
		cp -r ../templates/cpp/new_project $PROJECT_NAME
		cd $PROJECT_NAME
		sed -i -e "s/MY_PROJECT/$PROJECT_NAME/g" meson.build
		echo -n "Enter executable name: "
		read EXECUTABLE_NAME
		sed -i -e "s/MY_EXECUTABLE/$EXECUTABLE_NAME/g" meson.build
		meson setup build
		cp build/compile_commands.json .
		CHANGE_DIRECTORY_AT_THE_END=false
		break
	else
		echo "The directory already exist. Aborting"
	fi
}

PS3='Select language: '
CHANGE_DIRECTORY_AT_THE_END=true
select opt in python cpp Quit
do
	case $opt in
		"python")
			CreatePythonProject
			;;
		"cpp")
			CreateCPPProject
			;;
		"Quit")
			CHANGE_DIRECTORY_AT_THE_END=false
			break
			;;
		*)
			echo "Unrecognized option. Please choose again"
	esac
	
done

if $CHANGE_DIRECTORY_AT_THE_END
then
	cd $PROJECT_NAME
fi

echo "# $PROJECT_NAME\n" > README.md
git init
mv gitignore .gitignore # move invalid template to actual .gitignore
git add .
git commit -m "init"
