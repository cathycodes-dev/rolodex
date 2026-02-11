terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket       = "cathycodes-terraform-state"
    key          = "rolodex/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
  required_version = ">= 1.10"
}

provider "aws" {
  region = var.region

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
