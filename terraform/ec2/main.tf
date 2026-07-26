resource "aws_instance" "example" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]

  tags = {
    Name = "test"
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("C:/Users/lenovo/Desktop/julubatch2026/terraform/ec2/key.pem")   
    }
    inline = [
      "sudo yum update -y",
      "sudo yum install java-1.8.0-openjdk -y"
    ]
  }
  provisioner "file" {
    source      = "C:/Users/lenovo/Desktop/julubatch2026/terraform/ec2/test.ps1"
    destination = "/tmp/test.ps1"
  }
  provisioner "local-exec" {
    command = "aws ssm send-command --targets \"Key=instanceIds,Values=${self.id}\" --document-name \"AWS-RunPowerShellScript\" --comment \"Run PowerShell script\" --parameters 'commands=[\"powershell -File /tmp/test.ps1\"]' --region us-east-1"
  }
}



