Project: Infrastructure for a Static Website on AWS using Terraform

Project Overview
This project deploys infrastructure for hosting a static website on Amazon EC2 using Terraform. The infrastructure uses an Application Load Balancer (ALB) to distribute traffic between EC2 instances located in two availability zones. Auto Scaling is used to ensure high availability and scalability.

Architecture
Below is the architecture diagram that is created using the Terraform code provided:
<img width="1105" alt="ec2-alb-asg" src="https://github.com/user-attachments/assets/63697c26-4dba-4700-85e3-b9efa7b71225">

Architecture Components:
  - Route 53: Manages DNS requests and forwards traffic to the ALB.
  - Application Load Balancer (ALB): Distributes incoming HTTP traffic between EC2 instances in the target group.
  - Auto Scaling Group (ASG): Manages the launching and termination of EC2 instances based on metrics and scaling policies.
  - EC2 Instances: Instances that host the static website.
  - VPC and Subnets: A Virtual Private Cloud, divided into two subnets, each located in a different availability zone.
  - Internet Gateway (IGW): Provides internet access to instances in public subnets.
  - Security Group: Controls inbound and outbound traffic rules.

Main Terraform Resources
1. Application Load Balancer (ALB)
  Creates an ALB to distribute traffic between EC2 instances.
  Configures the target group for the ALB with health checks.
2. Auto Scaling Group (ASG)
  Sets up an Auto Scaling Group to manage EC2 instances.
  Uses dynamic blocks to automatically update configurations when the launch template changes.
3. EC2 Instances
  EC2 instances are launched using the latest Amazon Linux 2 AMI and are deployed in two different availability zones.
4. Route 53 DNS
  Creates a DNS record in Route 53 pointing to the ALB.
5. Security Groups
  Configures security groups to allow traffic on ports 80 and 443 for the web server.
6. VPC and Subnets
  Creates a VPC with two public subnets in different availability zones.
  Configures a route table to enable internet access via an Internet Gateway.

Dynamic Site Updates
When the user data script or any other resource is updated, the ASG automatically creates new EC2 instances with the updated launch template. The old instances remain active until the new ones pass health checks, ensuring uninterrupted service.
