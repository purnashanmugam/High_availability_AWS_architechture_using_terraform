resource "aws_security_group" "asg_security_group" {
  name        = "asg_security_group"
  description = "Allow inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "asg_security_group"
  }
}

