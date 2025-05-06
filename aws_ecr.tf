resource "aws_ecr_repository" "bia" {
  name = "bia"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = false
  }
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "bia"
    Environment = "TF"
  }
}