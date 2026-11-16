variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "url_shortener_repo" {
  description = "project repository "
  type        = string
  default     = "url-shortener"
}
