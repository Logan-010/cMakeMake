#!/bin/bash

# Set the username
username=$(whoami)

# Copy the folder
cp -r cmakemake /home/$username

# Add the folder to PATH
echo "export PATH=\$PATH:/home/$username/cmakemake" >> /home/$username/.bashrc

# Source the .bashrc to apply changes immediately
source /home/$username/.bashrc

echo "cmakemake installed! (and added to path)"
echo "use via cmakemake.sh"
