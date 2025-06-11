resource "aws_instance" "roboshop" {
  # for_each = var.instances
  for_each =  toset(var.instances)
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}
