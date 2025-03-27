#!/bin/bash

# Usage: ./new_page.sh <archetype> <page-name>
# Example: ./new_page.sh posts my-new-post

# Ensure an archetype and page name are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <archetype> <page-name>"
	echo "Archetype should not include trailing slash"
	echo "Page Name should not include .md file extension"
    exit 1
fi

ARCHETYPE=$1  # The archetype type (e.g., posts, pages) - should be able to specify paths
PAGE_NAME=$2  # The name of the new page
# Generate a new Hugo page
hugo new $ARCHETYPE/$PAGE_NAME.md

# Determine the path of the newly created file
NEW_PAGE_PATH="content/$ARCHETYPE/$PAGE_NAME.md"
echo "New page created at: $NEW_PAGE_PATH"

# Extract the unique_id from the generated file
UNIQUE_ID=$(grep 'unique_id' $NEW_PAGE_PATH | awk '{print $3}' | tr -d '"')

# Create the corresponding assets folder
mkdir -p static/assets/$UNIQUE_ID
echo "Asset folder created at static/assets/$UNIQUE_ID"
