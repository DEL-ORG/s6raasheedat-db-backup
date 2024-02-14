#!/bin/bash

# Update package lists
sudo apt-get update

# Install required packages

# Install tree and apt-utils
sudo apt-get install -y tree apt-utils curl unzip

# Add the GPG key for the official Kubernetes repository
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
# Add the Kubernetes apt repository
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
# Update package lists
apt-get update
# Install kubectl, kubectx, and helm
sudo snap install helm --classic,
sudo snap install kubectl --classic,
sudo snap install kubectx --classic

# Install awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/3.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install mysql-client and postgresql-client
sudo apt-get install -y mysql-client postgresql-client

# Install Docker Engine
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Install OpenJDK
sudo apt-get install -y openjdk-11-jdk openjdk-11-jre

# Install Python 3 and pip3
sudo apt-get install -y python3 python3-pip

# Install Git
sudo apt-get install -y git

# Add the Node.js PPA
curl -sL https://deb.nodesource.com/setup_14.x | bash -
sudo apt-get install -y nodejs

# Install Maven
sudo apt-get install -y maven

# Install wget
sudo apt-get install -y wget

# Install Ansible
sudo apt-get install -y ansible

# Add the HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
# Add the HashiCorp repository
echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
# Update package lists
sudo apt-get update
# Install Terraform
sudo snap install terraform --classic

# Install htop, vim, watch, build-essential, openssh-server
sudo apt-get install -y htop vim watch build-essential openssh-server

# Update pip
pip3 install --upgrade pip