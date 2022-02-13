resource "aws_vpc" "demo" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  tags = {
    Name = "demo"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "demo"
  }
}

resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.demo.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
}
resource "aws_subnet" "main1" {
  vpc_id     = aws_vpc.demo.id
  availability_zone = "us-east-2a"
  cidr_block = var.cider1

  tags = {
    Name = "demo1"
  }
}

resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.demo.id
  availability_zone = "us-east-2b"
  cidr_block = var.cider2

  tags = {
    Name = "demo2"
  }
}