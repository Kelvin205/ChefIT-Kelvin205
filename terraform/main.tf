resource "aws_s3_bucket" "dummy" {
  bucket = "chefit-dummy-${random_id.suffix.hex}"
  force_destroy = true
}

resource "random_id" "suffix" {
  byte_length = 4
}