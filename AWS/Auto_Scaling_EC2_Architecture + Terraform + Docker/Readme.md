# Auto-Scaling containerized EC2 Architecture

## Overview
This project simulates a production-grade like web infrastructure on AWS. The goal was to 
build something that could handle traffic spikes automatically without manual intervention.

An Nginx app runs inside Docker containers, with images stored in ECR. When a new EC2 
instance spins up, a User Data bash script pulls the latest image and starts the container 
automatically — no SSH, no manual setup.

Auto Scaling is triggered by CloudWatch when CPU hits 80%, with SNS sending email alerts 
in real time. Load testing was done using stress-ng to verify the scaling actually fired 
under simulated production load.

## Architecture
![Architecture Diagram](docs/Architecture_diagra.png)

## Tech Stack
- AWS EC2, Auto Scaling Groups, ALB
- Docker
- (any IaC tools you used)

## Features
- What problem this solves
- Key technical decisions you made

## Prerequisites
- AWS CLI configured
- Docker installed

## How to Run
Step by step commands to deploy this

## What I Learned
Honest reflection — interviewers love this
