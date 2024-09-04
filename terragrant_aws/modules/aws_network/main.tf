#Create VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.env}-vpc"
  }
}

# Create Public Subnets
resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = "true" //it makes this subnet public
  availability_zone       = var.azs[count.index]
  tags = {
    Name = "${var.env}-${var.public_subnet_name[count.index]}"
  }
}

#Create IGW
resource "aws_internet_gateway" "IGW_Web" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.env}-IGW-web"
  }
}

#Create route
resource "aws_route_table" "RT_web" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW_Web.id
  }
  tags = {
    Name = "${var.env}-RT-web"
  }
}

# Associate route table with public subnets
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.RT_web.id
}

# Create SG for web
resource "aws_security_group" "web-sg" {
  name   = "Web security group"
  vpc_id = aws_vpc.main.id
  dynamic "ingress" {
    for_each = var.allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.env}-Web-SG"
  }
}
