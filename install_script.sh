#!/bin/bash

# Function to clone and install from a repository
install_repo() {
    repo_url=$1
    echo "Cloning repository: $repo_url"
    git clone $repo_url
    repo_name=$(basename $repo_url .git)

    cd $repo_name
    echo "Processing repository: $repo_name"

    if [ -f "requirements.txt" ]; then
        echo "Found requirements.txt in $repo_name, installing dependencies..."
        pip install -r requirements.txt
    fi

    if [ -f "install.py" ]; then
        echo "Found install.py in $repo_name, executing script..."
        python install.py
    fi

    echo "Completed processing $repo_name"
    cd ..
}

echo "Starting installation process..."

# Read each line in repos.txt and install
while IFS= read -r repo; do
    if [[ $repo != \#* ]]; then  # Skip lines starting with #
        install_repo $repo
    fi
done < "/repos.txt"

echo "All repositories processed."
