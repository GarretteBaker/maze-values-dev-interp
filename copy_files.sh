#!/bin/bash

# Define the paths
FORKED_REPO_PATH="/workspace/train-procgen-pytorch_devinterp"
PROCGENAISC_PATH="/workspace/train-procgen-pytorch"

# Ensure paths exist
if [ ! -d "$FORKED_REPO_PATH" ]; then
    echo "Forked repository path does not exist."
    exit 1
fi

if [ ! -d "$PROCGENAISC_PATH" ]; then
    echo "ProcgenAISC path does not exist."
    exit 1
fi

# Copy the contents from ProcgenAISC to the forked repository
# This will overwrite files in the forked repository with those from ProcgenAISC
cp -R "$PROCGENAISC_PATH/"* "$FORKED_REPO_PATH/"

# Confirmation message
echo "Files copied successfully from train-procgen-pytorch to the forked repository."
