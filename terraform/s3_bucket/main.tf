resource "aws_s3_bucket" "example" {
  count = 3
  bucket = "${var.bucket_name}-${count.index}"

  tags = {
    Name        = "My bucket"
    Environment = "prod"
  }
}
