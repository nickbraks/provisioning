#!/usr/bin/env bash

# Get packages to be updated
sudo apt-get -y update

# Upgrade packages recieved from update
sudo apt-get -y upgrade

# -- Backend -- 

# Install Java -> Java 8 is required.
sudo apt-get -y install openjdk-8-jdk

# Install maven
sudo apt-get -y install maven

# Install TomEE plus in home directory of current user
cd ~
sudo wget "repo.maven.apache.org/maven2/org/apache/tomee/apache-tomee/7.0.2/apache-tomee-7.0.2-plus.tar.gz"
sudo tar -xvzf apache-tomee-7.0.2-plus.tar.gz

# Get researchtool backend code.
sudo git clone https://git.icaprojecten.nl/stash/scm/ntjaoy/onderzoekstool-backend.git

# Go to location of backend tool
cd onderzoekstool-backend

# Make war
sudo mvn package

# Mave WAR to TomEE plus dir
cd target/
sudo mv onderzoekstool-backend-0.1.war ~/apache-tomee-plus-7.0.2/webapps/

# Serve WAR
cd ~/apache-tomee-plus-7.0.2/bin
sudo ./catalina.sh start


# -- Frontend --
cd ~

# Install nodeJS for angular
sudo apt-get -y install nodejs

# Install NPM
sudo apt-get -y install npm

# Install angular
sudo npm install -g @angular/cli@latest

# Remove made src map and put the researchetool frontend from bitbucket 
sudo git clone https://git.icaprojecten.nl/stash/scm/ntjaoy/onderzoekstool-frontend.git

# Install all dependencies for the project
cd ~/onderzoekstool-frontend/
sudo npm install

# Serve
sudo ng serve --port=80 --host=node158.tezzt.nl
