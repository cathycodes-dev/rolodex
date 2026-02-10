 ### 🚩 _DEVELOPMENT IN-PROGRESS_ 🚩

# Rolodex project

This repository will contain the Rolodex project for creating a database + API that will be used in managing contacts and event attendance.

## Overview



## Repository Structure

Initial Draft
```
.
├── README.md
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── modules/
├── project/
│   ├── index.html
└── .github/
    └── workflows/
        └── deploy.yml
    
```

## Deployment Workflow

The automated deployment pipeline will work as follows

1. **Push changes** to the main branch
2. **GitHub Actions** runs
   * Terraform fmt, validate, init, plan, and apply
   * Uploads website content to S3
   * 
3. 

## Prerequisites

_TBD (will include Terraform, AWS CLI, and required GitHub secret variable names)_

## Future Goals


## About This Project

