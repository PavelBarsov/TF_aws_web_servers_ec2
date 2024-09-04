# Project: Infrastructure for a Static Website on AWS using Terraform (Modular Approach)

## Project Overview

This project showcases the **deployment of a scalable and highly available web infrastructure on AWS** using Terraform modules. The infrastructure uses several AWS services such as EC2, ALB, Route 53, and VPC, organized into reusable modules. This approach enhances maintainability and promotes the **DRY (Don't Repeat Yourself)** principle, making it suitable for medium to large-scale projects.

## Architecture

Below is the architecture diagram for the infrastructure created using modular Terraform code:

<img width="1105" alt="ec2-alb-asg" src="https://github.com/user-attachments/assets/63697c26-4dba-4700-85e3-b9efa7b71225">

### Architecture Components:
- **VPC and Subnets**: A Virtual Private Cloud (VPC) is created with two public subnets, one in each availability zone, providing high availability for the EC2 instances.
- **Application Load Balancer (ALB)**: The ALB distributes incoming traffic between EC2 instances in the target group, ensuring load balancing and scalability.
- **Auto Scaling Group (ASG)**: The ASG manages the lifecycle of EC2 instances, scaling them based on demand.
- **EC2 Instances**: These instances are used to host the web application, and they automatically scale up or down based on traffic and usage.
- **Route 53**: Manages DNS records, routing traffic to the ALB. In this project, Route 53 ensures the correct DNS routing for the application.
- **SSL Certificate**: An SSL certificate is provisioned and used by the ALB to secure HTTPS traffic.

### Module Components:
1. **aws_network**: This module provisions the VPC, subnets, and security groups to create the network layer.
2. **aws_alb**: This module creates the Application Load Balancer along with its associated security groups and targets.
3. **aws_r53**: This module provisions DNS entries in Route 53 for traffic routing.
4. **aws_ec2**: This module provisions the EC2 instances that serve the application, along with their associated configurations such as instance type, AMI, and user data.

## Conclusion

This project demonstrates the modular deployment of a web infrastructure on AWS using Terraform. The use of reusable modules enables better scalability and maintainability of the infrastructure code. By leveraging Terraform, this infrastructure is fully automated, making it easier to manage, update, and replicate across multiple environments.