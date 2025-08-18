terraform {
  backend "s3" {
    bucket         = "bia-nh-tfstate"
    key            = "state.tfstate"
    region         = "us-east-1"
  }
}