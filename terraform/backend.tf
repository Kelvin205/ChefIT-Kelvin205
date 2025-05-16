terraform {
  backend "s3" {
    bucket = "chefit-kelvin205"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
}