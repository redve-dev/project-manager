#!/bin/bash

export TEMPLATES=$PWD/templates

select choose in create_project create_cpp_class Quit
do
	case $choose in
		"create_project")
			bash subscripts/create_project.sh
			break
			;;
		"create_cpp_class")
			bash subscripts/create_cpp_class.sh
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
