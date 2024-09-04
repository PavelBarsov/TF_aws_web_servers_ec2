# AWS Infrastructure Deployment Using Terraform

This repository showcases three different approaches for deploying AWS infrastructure using Terraform. Each directory contains a separate example, demonstrating a unique method to achieve similar infrastructure goals.

## Repository Structure

### 1. tf_aws_ec2_simple

This folder contains a simple example where the infrastructure is defined using **individual Terraform files**. 
- It demonstrates basic Terraform usage without any modularization or advanced features.
- Ideal for small projects or beginners looking to understand Terraform syntax and workflow.

### 2. tf_aws_module

In this folder, the infrastructure is organized into **reusable modules**. 
- Each part of the infrastructure (such as EC2 instances, VPC, etc.) is encapsulated into a module, allowing for better structure and reusability.
- This approach is ideal for medium to large projects where you want to apply **DRY (Don’t Repeat Yourself)** principles.

### 3. terragrunt_aws

This folder showcases how to manage Terraform infrastructure using **Terragrunt**, which helps in maintaining multiple environments (e.g., dev, qa, prod). 
- It uses a `terragrunt.hcl` file to apply Terraform code for multiple environments, enhancing infrastructure-as-code (IaC) best practices.
- This approach is recommended for teams managing complex infrastructure across different environments.
