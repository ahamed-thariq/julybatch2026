provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "jatinbhalla1991"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_security_group" "example" {
  name        = "jatinbhalla1991-security-group"
  description = "jatinbhalla1991 security group"
  tags = {
    Name = "jatinbhalla1991-security-group"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}