# VPC with Internet Access
resource "aws_vpc" "devvpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "devvpc"
  }
}

# Subnets
resource "aws_subnet" "devvpc-public-0" {
  vpc_id                  = aws_vpc.devvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AWS_REGION}a"

  tags = {
    Name = "devvpc-public-0"
  }
}

resource "aws_subnet" "devvpc-public-1" {
  vpc_id                  = aws_vpc.devvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AWS_REGION}b"

  tags = {
    Name = "devvpc-public-1"
  }
}


resource "aws_subnet" "devvpc-private-1" {
  vpc_id                  = aws_vpc.devvpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AWS_REGION}a"

  tags = {
    Name = "devvpc-private-1"
  }
}



# Internet GW
resource "aws_internet_gateway" "devvpc-gw" {
  vpc_id = aws_vpc.devvpc.id

  tags = {
    Name = "devvpc_igw"
  }
}

# route tables
resource "aws_route_table" "devvpc-public" {
  vpc_id = aws_vpc.devvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devvpc-gw.id
  }

  tags = {
    Name = "devvpc-public-1"
  }
}

# route associations public
resource "aws_route_table_association" "devvpc-public-0-a" {
  subnet_id      = aws_subnet.devvpc-public-0.id
  route_table_id = aws_route_table.devvpc-public.id
}

resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.main-public.id

}
