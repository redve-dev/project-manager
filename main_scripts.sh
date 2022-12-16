#!/bin/bash

PS3="Select your choice: "
# TODO add installer to generate absolute path
dir='/home/redve/Programming/projects/bash/project-manager'
export TEMPLATES=$dir/templates

select choose in create_project create_cpp_class Quit
do
	case $choose in
		"create_project")
			bash $dir/subscripts/create_project.sh
			break
			;;
		"create_cpp_class")
			bash $dir/subscripts/create_cpp_class.sh
			break
			;;
		"Quit")
			break
			;;
		*)
			echo "Unrecognized option. Please choose again"
			;;
	esac
done
