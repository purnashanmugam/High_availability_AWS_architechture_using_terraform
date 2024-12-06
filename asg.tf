resource "aws_launch_template" "launch_template" {
  name_prefix   = "web-launchtemplate"
  image_id      = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  key_name = "ansible-key-pair"
  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.asg_security_group.id]
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }
  user_data = filebase64("user-data.sh")
}

resource "aws_autoscaling_group" "asg" {
  name = "asg-high-avail"
  target_group_arns = [aws_lb_target_group.target-group.arn]
  desired_capacity   = 2
  max_size           = 3
  min_size           = 1
  vpc_zone_identifier = [aws_subnet.web-subnet1.id, aws_subnet.web-subnet2.id]

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }
}