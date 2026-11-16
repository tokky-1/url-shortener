resource "aws_ecr_repository" "url_shortener" {
  name                 = var.url_shortener_repo
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

}