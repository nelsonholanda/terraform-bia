terraform {
  backend "s3" {
    bucket         = "bia-tf-nh1"
    key            = "state.tfstate"
    region         = "us-east-2"
  }
}