terraform {
  backend "s3" {
    bucket         = "bia-tf-nh"
    key            = "state.tfstate"
    region         = "us-east-2"
  }
}