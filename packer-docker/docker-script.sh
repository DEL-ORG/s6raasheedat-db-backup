#!/bin/bash

# Update package lists
sudo apt update

# Install packages
   sudo apt-get update,
   sudo apt-get install -y tree apt-utils awscli docker-compose mysql-client postgresql-client docker.io default-jdk default-jre python3 python3-pip git nodejs npm maven wget ansible htop vim watch build-essential openssh-server snapd,  # Install Snap package manager
   sudo snap install terraform --classic,  # Include --classic flag for Terraform installation
   sudo snap install helm --classic,
   sudo snap install kubectl --classic,
   sudo snap install kubectx --classic,   # Include --classic flag for kubectx 

# Clean up package cache
sudo apt clean
