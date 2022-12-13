#!/bin/bash

function CreatePythonProject(){
	echo -n "Enter project name: "
	read PROJECT_NAME
	if [[ ! -d $PROJECT_NAME ]]; then
		cp -r $TEMPLATES/python/new_project $PROJECT_NAME
	else
		echo "The directory already exist. Aborting"
	fi
}

function CreateCPProject(){
	echo -n "Enter project name: "
	read PROJECT_NAME
	if [[ ! -d $PROJECT_NAME ]]; then
		cp -r $TEMPLATES/cpp/new_project $PROJECT_NAME
		cd $PROJECT_NAME
		sed -i -e "s/MY_PROJECT/$PROJECT_NAME/g" meson.build
		echo -n "Enter executable name: "
		read EXECUTABLE_NAME
		sed -i -e "s/MY_EXECUTABLE/$EXECUTABLE_NAME/g" meson.build
		meson setup build
		cp build/compile_commands.json .
	else
		echo "The directory already exist. Aborting"
	fi
}

function CreateCProject(){
	echo -n "Enter project name: "
	read PROJECT_NAME
	if [[ ! -d $PROJECT_NAME ]]; then
		cp -r $TEMPLATES/cpp/new_project_pure_c $PROJECT_NAME
		cd $PROJECT_NAME
		sed -i -e "s/MY_PROJECT/$PROJECT_NAME/g" meson.build
		echo -n "Enter executable name: "
		read EXECUTABLE_NAME
		sed -i -e "s/MY_EXECUTABLE/$EXECUTABLE_NAME/g" meson.build
		meson setup build
		cp build/compile_commands.json .
	else
		echo "The directory already exist. Aborting"
	fi
}

function MAIN(){
	PS3='Select language: '
	select opt in python c cpp Quit
	do
		case $opt in
			"python")
				CreatePythonProject
				break
				;;
			"c")
				CreateCProject
				break
				;;
			"cpp")
				CreateCPProject
				break
				;;
			"Quit")
				exit
				;;
			*)
				echo "Unrecognized option. Please choose again"
				;;
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
}
MAIN
