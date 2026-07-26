# output "bucket_names" {
#   value = module.s3_bucket.bucket_name
# }

output "security_group_id" {
  value = module.security_group.aws_security_group_id
}