#Create VPC
resource "aws_vpc" "web_test_vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "web_vpc"
  }
}

#Create Subnet-1
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.web_test_vpc.id
  cidr_block              = "192.168.1.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "subnet_1"
  }
}

#Create Subnet-2
resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.web_test_vpc.id
  cidr_block              = "192.168.2.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "subnet_2"
  }
}

#Create IGW
resource "aws_internet_gateway" "IGW_Web" {
  vpc_id = aws_vpc.web_test_vpc.id
  tags = {
    Name = "IGW_web"
  }
}

#Create route
resource "aws_route_table" "RT_web" {
  vpc_id = aws_vpc.web_test_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW_Web.id
  }
  tags = {
    Name = "RT_web"
  }
}

#Create route table association
resource "aws_route_table_association" "rta_subnet_1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.RT_web.id
}
resource "aws_route_table_association" "rta_subnet_2" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.RT_web.id
}
