resource "aws_security_group" "example" {
  name        = var.security_group_name
  description = var.security_group_description
  tags = {
    Name = var.security_group_name
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}