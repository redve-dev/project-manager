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

PS3='Select language: '
LANGUAGES=("python" "cpp")
select opt in ${LANGUAGES[@]} Quit
do
	case $opt in
		"python")
			CreatePythonProject
			;;
		"cpp")
			break
			;;
	esac
done

#cd $PROJECT_NAME
