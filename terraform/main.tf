terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "${var.region}"
  
  default_tags {
    tags = {
      Owner       = "${var.owner}"
      Project     = "${var.project_name}"
      Environment = "${var.environment}"
    }
  }
}

resource "aws_s3_bucket" "project_resources" {
  bucket = "${var.project_name}-${var.environment}" 

}