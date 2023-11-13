#!/bin/bash
sudo hostnamectl set-hostname "jenkins.cloudbinary.io"
echo "`hostname -I | awk '{ print $1 }'` `hostname`" >> /etc/hosts
sudo apt-get update
sudo apt-get install git wget unzip curl tree -y
sudo apt-get install openjdk-17-jdk -y
sudo cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"
echo "JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/" >> /etc/environment
sudo apt-get install maven -y
sudo cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"
echo "MAVEN_HOME=/usr/share/maven" >> /etc/environment
source /etc/environment
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
