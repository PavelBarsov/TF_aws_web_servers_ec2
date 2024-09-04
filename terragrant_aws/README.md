# Project: Infrastructure for a Static Website on AWS using Terraform and Terragrunt

## Project Overview

This project demonstrates how to manage the deployment of AWS infrastructure for a static website using **Terraform** and **Terragrunt**. Terragrunt helps with managing multiple environments (e.g., `dev`, `staging`) by utilizing Terraform modules and automating the process of keeping your infrastructure DRY (Don't Repeat Yourself). The infrastructure includes **EC2 instances**, **Application Load Balancer (ALB)**, **Route 53 DNS**, **Auto Scaling**, and more.

Terragrunt is used to handle the repetition of configuration across environments and simplifies the process of applying the same Terraform code to different stages (e.g., dev, staging).

## Architecture

The architecture of this project includes the following AWS components:

<img width="1105" alt="ec2-alb-asg" src="https://github.com/user-attachments/assets/63697c26-4dba-4700-85e3-b9efa7b71225">

### Architecture Components:
- **VPC and Subnets**: A Virtual Private Cloud (VPC) is created with public subnets across multiple availability zones for high availability.
- **Application Load Balancer (ALB)**: Distributes traffic to the EC2 instances across different availability zones.
- **Auto Scaling Group (ASG)**: Manages the automatic scaling of EC2 instances based on traffic demand.
- **EC2 Instances**: Serve as web servers hosting the application. Each instance is created using a `user_data.sh` script for web server configuration.
- **Route 53**: Manages DNS records for routing traffic to the ALB.
- **SSL Certificate**: Configures SSL for secure HTTPS communication via the ALB.


### Key Files in the `env` Directory:

- **common.tfvars**: Defines environment-specific variables such as the AWS region, instance types, and scaling capacities.
- **terragrunt.hcl**: This file includes the common variables for all environments and configurations. Each subdirectory (`dev`, `staging`) has its own `terragrunt.hcl` files to specify environment-specific infrastructure.

### Modules Directory:

The `modules` directory contains reusable Terraform code for provisioning AWS resources such as **ALB**, **EC2**, **VPC**, and **Route 53**.

### Environments:
- **dev**: Development environment with two EC2 instances, configured via `dev` folder.
- **staging**: Staging environment with three EC2 instances, configured via `staging` folder.

## Main Terragrunt Files

### Environment (`dev`, `staging`) Configuration:
Each environment (`dev`, `staging`) has a directory that contains Terragrunt configuration (`terragrunt.hcl`) to deploy the environment-specific resources:

- **network/terragrunt.hcl**: Defines the VPC, subnets, and security groups.
- **alb/terragrunt.hcl**: Defines the Application Load Balancer, security groups, and SSL certificate configuration.
- **ec2/terragrunt.hcl**: Defines EC2 instances and their scaling configurations.
- **r53/terragrunt.hcl**: Manages Route 53 DNS records, pointing to the ALB for load balancing.

## Key Features

- **Terragrunt Integration**: Terragrunt is used to manage Terraform configuration across different environments and automate the application of shared variables.
- **Reusable Modules**: The infrastructure is divided into Terraform modules (e.g., `aws_alb`, `aws_ec2`, `aws_network`, `aws_r53`), which make it easy to reuse the same configuration across environments.
- **Auto Scaling**: EC2 instances are automatically scaled based on traffic using Auto Scaling Group (ASG).
- **SSL Integration**: SSL certificates are used to enable HTTPS traffic for secure communication.

## Main Terraform Resources

1. **Application Load Balancer (ALB)**: Configures load balancing across EC2 instances. SSL certificates are attached to ensure HTTPS communication.
2. **EC2 Instances**: EC2 instances are created using the `aws_ec2` module. User data scripts are executed during instance launch to configure web servers.
3. **Route 53 DNS**: Creates a DNS record pointing to the ALB using the `aws_r53` module.
4. **VPC and Subnets**: Configures VPCs and subnets for public access via the `aws_network` module.
5. **Security Groups**: Configures security groups for controlling access to instances.

## Dynamic Site Updates

**User data scripts** allow automatic reconfiguration of EC2 instances when changes are applied. Terragrunt manages these updates across environments to ensure consistent configuration across different stages.

## Conclusion

By utilizing **Terragrunt**, this project achieves highly maintainable infrastructure that scales across multiple environments. The use of reusable Terraform modules and environment-specific configurations enables efficient infrastructure management and simplifies changes across all stages.
