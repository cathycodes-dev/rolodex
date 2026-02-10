variable "owner" {
  type    = string
  default = "Cathy-Codes"
}

variable "project_name" {
  type    = string
  default = "rolodex"
}

variable "region" {
  description = "the AWS region"
  type        = string
  default     = "us-east-1"
}


variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}


variable "repo_bucket" {
    type = string 
    description = "S3 Bucket to contain project repositry & infrastructure files"
    default =  "${var.project_name}-${var.environment}-repo" 
}
