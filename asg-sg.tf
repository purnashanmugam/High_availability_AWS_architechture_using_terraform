resource "aws_security_group" "asg_security_group" {
  name        = "asg_security_group"
  description = "Allow inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "asg_security_group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "asg_ingress_rule" {
  security_group_id = aws_security_group.asg_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "asg_egress_rule" {
  security_group_id = aws_security_group.asg_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}