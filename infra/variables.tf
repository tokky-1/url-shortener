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

variable "url_vpc" {
  description = "project virtual private network "
  type        = string
  default     = "url-shortener-vpc"
}

variable "url_subnet" {
  description = "public subnet "
  type        = string
  default     = "url-shortener-pub-subnet"
}

variable "url_int_gate" {
  description = "project internet gateway "
  type        = string
  default     = "url-shortener-gateway"
}

variable "url_route" {
  description = "project route table "
  type        = string
  default     = "url-route-table"
}