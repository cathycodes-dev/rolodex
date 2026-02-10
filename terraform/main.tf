terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket       = local.repo_bucket
    key          = "infrastructure/terraform.tfstate"
    region       = var.region
    use_lockfile = true
    encrypt      = true
  }
  required_version = ">= 1.10"
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
  bucket = local.repo_bucket
}
