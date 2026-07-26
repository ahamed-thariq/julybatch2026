module "s3_bucket" {
  source = "./s3_bucket"
  bucket_name = var.bucket_name
}

module "security_group" {
  source = "./security_group"
  security_group_name = var.security_group_name
  security_group_description = var.security_group_description
}

data "aws_vpc" "default" {
  default = true
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "default" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = cidrsubnet(data.aws_vpc.default.cidr_block, 8, 0)
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "terraform-default-subnet"
  }
}

module "ec2" {
  depends_on = [module.security_group]
  source = "./ec2"
  security_group_id = module.security_group.aws_security_group_id
  subnet_id         = aws_subnet.default.id
}
