# Input variable definitions

variable "aws_region" {
  description = "AWS region for all resources."

  type    = string
  default = "us-east-2"
}

variable "domain_name" {
  type = string
  description = "The domain name for the website."
  default = "whatalesyou.net"
}

variable "bucket_name" {
  type = string
  description = "The name of the bucket without the www. prefix. Normally domain_name."
  default = "whatalesyou.net"
}

variable "project_tag" {
  description = "Tag for the project"
  default = "what-ales-you"
}

variable "prod_env_tag" {
  description = "Signifies that this resource is for production env"
  default = "production"
}

variable "staging_env_tag" {
  description = "Signifies that this resource is for staging env"
  default = "staging"
}