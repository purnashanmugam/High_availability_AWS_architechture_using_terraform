#High Availability AWS Infrastructure Project using Terraform
---
##Project Description
---
This project demonstrates the implementation of a high-availability infrastructure in AWS using Auto Scaling Groups (ASG) and Elastic Load Balancers (ELB) with Terraform. It includes the setup of a Virtual Private Cloud (VPC), subnets, an Internet Gateway (IG), and route tables. 

##Key Features
---
1) Auto Scaling Groups (ASG):
Dynamically adjust the number of instances based on traffic patterns, ensuring optimal resource utilization and reliability.
2) Elastic Load Balancers (ELB):
Distribute incoming traffic evenly across multiple instances, eliminating single points of failure and enhancing availability.
3) Fault Tolerance:
Designed to be fault-tolerant, capable of withstanding component failures without causing downtime through redundancy and failover mechanisms.
4) Virtual Private Cloud (VPC):
Provides a dedicated virtual network for resources, isolated from other AWS accounts.
5) Subnets:
Subdivisions of the VPC to host instances in different availability zones, enhancing redundancy.
6) Internet Gateway (IG):
Allows communication between the VPC and the public internet.
7) Route Tables:
Define routing rules to direct traffic within the VPC and to the Internet Gateway.

##Prerequisites
---
Before you begin, ensure you have the following:
1) Install Terraform and AWS CLI
```
#Install terraform with below steps on ubuntu
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform
```
```
#Install AWS cli using below commands
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip

sudo ./aws/install
```
  
2) Create an IAM User with Required Permissions. Ensure the IAM user has sufficient permissions to manage EC2, VPC, ELB, and Auto Scaling resources.
3) Configure AWS CLI Using Access and Secret Keys:
```
aws configure
AWS Access Key ID [None]: YOUR_ACCESS_KEY_ID
AWS Secret Access Key [None]: YOUR_SECRET_ACCESS_KEY
Default region name [None]: us-east-1
Default output format [None]: json
```
##Terraform Configuration:
---
The Terraform configuration files with(*.tf) in this repository define the AWS resources and settings required to create the high availability infrastructure.

##Steps:
1) Installing required packages and AWS plugins using terrform providers
2) Create VPC, subnets, internet gateway
3) Create load balancer, target group, target group listener and security group
4) Create auto scaling group
5) Create a launch template for provisioning EC2 instances
6) Add user data in the template to install and start appache service in the ubuntu EC2 instances

##Clone the Repository:
```
https://github.com/purnashanmugam/High_availability_AWS_architechture_using_terraform.git
```
##Initialize Terraform:
```
terraform init
```
##Initialize Terraform:
```
terraform plan
```
Apply the Configuration:
```
terraform apply
```

