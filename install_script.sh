#!/bin/bash

# Function to clone and install from a repository
install_repo() {
    repo_url=$1
    git clone $repo_url
    repo_name=$(basename $repo_url .git)

    cd $repo_name
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt
    fi

    if [ -f "install.py" ]; then
        python install.py
    fi

    cd ..
}

# Read each line in repos.txt and install
while IFS= read -r repo; do
    if [[ $repo != \#* ]]; then  # Skip lines starting with #
        install_repo $repo
    fi
done < "/repos.txt"
