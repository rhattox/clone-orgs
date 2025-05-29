#!/bin/bash

# Declare associative array to hold projects and repositories (Matrix-like)
declare -A projects

# Define the repositories in each project
projects["rhattox-ansible,ansible-kubernetes"]="git@github.com:rhattox-ansible/ansible-kubernetes.git"
projects["rhattox-ansible,ansible-k8s-arc-runner"]="git@github.com:rhattox-ansible/ansible-k8s-arc-runner.git"
projects["rhattox-ansible,ansible-argocd"]="git@github.com:rhattox-ansible/ansible-argocd.git"
projects["rhattox-ansible,ansible-ansible"]="git@github.com:rhattox-ansible/ansible-ansible.git"
projects["rhattox-ansible,ansible-docker"]="git@github.com:rhattox-ansible/ansible-docker.git"
projects["rhattox-ansible,ansible-nexus"]="git@github.com:rhattox-ansible/ansible-nexus.git"
projects["rhattox-ansible,ansible-hashicorp"]="git@github.com:rhattox-ansible/ansible-hashicorp.git"
projects["rhattox-ansible,ansible-monitor"]="git@github.com:rhattox-ansible/ansible-monitor.git"
projects["rhattox-ansible,ansible-sonarqube"]="git@github.com:rhattox-ansible/ansible-sonarqube.git"
projects["rhattox-ansible,ansible-java"]="git@github.com:rhattox-ansible/ansible-java.git"
projects["rhattox-ansible,ansible-jenkins"]="git@github.com:rhattox-ansible/ansible-jenkins.git"
projects["rhattox-ansible,ansible-nginx"]="git@github.com:rhattox-ansible/ansible-nginx.git"
projects["rhattox-ansible,ansible-config"]="git@github.com:rhattox-ansible/ansible-config.git"

projects["rhattox-shared-actions,shared-actions"]="git@github.com:rhattox-shared-actions/shared-actions.git"
projects["rhattox-shared-actions,toolbox"]="git@github.com:rhattox-shared-actions/toolbox.git"

projects["rhattox-helm-charts,deployment"]="git@github.com:rhattox-helm-charts/deployment.git"
projects["rhattox-helm-charts,persistent-volume"]="git@github.com:rhattox-helm-charts/persistent-volume.git"








cd ~/git

# Loop through all projects and repositories, and organize them into folders
for key in "${!projects[@]}"; do
  project=$(echo $key | cut -d',' -f1)  # Extract project name
  repo_name=$(echo $key | cut -d',' -f2)  # Extract repo name
  repo_url="${projects[$key]}"
  
  # Create the project folder if it doesn't exist
  if [ ! -d "$project" ]; then
    echo "Creating project folder: $project"
    mkdir "$project"
  fi
  
  # Change to the project directory
  cd "$project"
  
  # Clone the repository into the project folder
  if [ ! -d "$repo_name" ]; then
    echo "Cloning $repo_url into $project/$repo_name"
    git clone "$repo_url"
  else
    echo "Repository $repo_name already exists in $project"
  fi
  
  # Return to the parent directory to continue with the next project
  cd -
done

echo "Cloning completed!"
