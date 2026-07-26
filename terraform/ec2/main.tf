resource "aws_instance" "example" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t2.micro"
  security_groups = [var.security_group_id]

  tags = {
    Name = "test"
  }
}
