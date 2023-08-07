#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <project name> <c or cpp> <h or hpp>"
    echo "Creates basic cmake project based on cli config"
    exit 1
fi

new_project_name="$1"
dir=$(pwd)
username=$(whoami)

# Check if the directory already exists
if [ -d "$new_project_name" ]; then
    echo "ERR! Directory already exists!: $new_project_name"
    exit 1
else
    mkdir "$new_project_name"
    echo "Directory created: $new_project_name"
fi

project_zip="cmake_default.tar.gz"
tar -xzf "/home/$username/cmakemake/$project_zip" -C "$dir/$new_project_name"
echo "Copied default files into $new_project_name"
cd "$new_project_name"

cmake_file="CMakeLists.txt"

if [ ! -f "$cmake_file" ]; then
    echo "Error: CMakeLists.txt not found in the current directory."
    exit 1
fi

# Replace instances of "projectName" with the new project name in CMakeLists.txt
sed -i "s/projectName/$new_project_name/g" "$cmake_file"

# Check if the second argument is "c" and replace .cpp with .c in CMakeLists.txt
if [ "$2" == "c" ]; then
    sed -i "s/\.cpp/\.c/g" "$cmake_file"
fi

if [ "$3" == "hpp" ]; then
    sed -i "s/\.h/\.hpp/g" "$cmake_file"
fi

if [ "$2" == "c" ]; then
    echo "c project selected!"
fi

if [ "$2" == "cpp" ]; then
    echo "cpp project selected!"
fi

if [ "$3" == "h" ]; then
    echo "header files selected"
fi

if [ "$3" == "c" ]; then
    echo "header++ files selected!"
fi

echo "project created!"

echo "Done!"

cd ../