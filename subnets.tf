resource "aws_subnet" "web-subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.web-subnet1-cidr
  availability_zone = var.az-1
  tags = {
    Name = var.web-subnet1-name
  }
}

resource "aws_subnet" "web-subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.web-subnet2-cidr
  availability_zone = var.az-2
  tags = {
    Name = var.web-subnet2-name
  }
}