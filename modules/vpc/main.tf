resource "aws_vpc" "demo" {
  cidr_block       = var.cidr
  

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

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.cider

  tags = {
    Name = "demo"
  }
}