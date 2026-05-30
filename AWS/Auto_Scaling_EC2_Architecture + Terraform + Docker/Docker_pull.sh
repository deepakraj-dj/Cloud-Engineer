#!/bin/bash
ECR_REGISTRY=333372137025.dkr.ecr.us-east-1.amazonaws.com/portfolio/test:latest
sudo apt update -y
sudo apt install awscli -y
sudo apt install docker.io -y 
sudo systemctl start docker 
while ! sudo systemctl is-active --quiet docker; do
    sleep 1
done
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 333372137025.dkr.ecr.us-east-1.amazonaws.com
docker pull $ECR_REGISTRY
docker run -d -p 80:80 $ECR_REGISTRY

