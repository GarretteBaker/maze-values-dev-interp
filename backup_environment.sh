#!/bin/bash

# Set the path where you want to save the lists
output_directory="/workspace/environment_backup"
mkdir -p "$output_directory"

# Find all .git directories (cloned repositories)
echo "Finding all cloned git repositories..."
find / -type d -name .git > "$output_directory/git_repositories.txt"

# List Python packages
echo "Listing installed Python packages..."
pip list > "$output_directory/python_requirements.txt"

# List system packages based on distribution
if command -v dpkg &> /dev/null; then
    echo "Listing installed Debian-based packages..."
    dpkg --get-selections > "$output_directory/debian_packages.txt"
elif command -v rpm &> /dev/null; then
    echo "Listing installed Red Hat-based packages..."
    rpm -qa > "$output_directory/redhat_packages.txt"
else
    echo "System package manager not supported by this script."
fi

echo "Backup complete. Files saved in $output_directory"
