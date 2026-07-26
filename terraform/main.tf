module "s3_bucket" {
  source = "./s3_bucket"
  bucket_name = var.bucket_name
}

module "security_group" {
  source = "./security_group"
  security_group_name = var.security_group_name
  security_group_description = var.security_group_description
}

module "ec2" {
  depends_on = [module.security_group]
  source = "./ec2"
  security_group_id = module.security_group.aws_security_group_id
}
