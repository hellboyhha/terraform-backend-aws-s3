#  Storing Terrafrom State Files to AWS S3

## Storing Terraform state in version control have the following concerns.
#### Manual Error
> Can forget to pull down the latest changes(latest version state file) from version control before running terraform or to push your latest changes to version control after running Terraform.
#### Locking
> Can't prevent two team members from running terraform apply on the same state file at the same time because most version control systems do not provide any form of locking.
#### Secrets
> All data in Terraform state files including sensitive data is stored in plain text. Storing plain-text secrets anywhere is a bad idea, including version control.

## Shared Storage for state files
Terraform supports remote backends including Amazon S3; Azure Storage and Google Cloud Storage. Using remote backends solve all above concerns.

Pre-requisites:
* AWS Access Key and Secret Access Key
* Terraform installed


## Steps to store terrafrom state files to AWS S3

1. Export AWS Access Key and Secret Access Key in your terminal
<!-- Bash script block -->
````bash
export AWS_ACCESS_KEY_ID=(your aws access key id)
export AWS_SECRET_ACCESS_KEY=(your aws secret access key)
````
2. Clone the repo and go to **global/s3** directory and change your desired AWS S3 bucket and dynamodb table name in **main.tf** file.
* The following block in **main.tf** specifies AWS as the provider:
````bash
provider "aws" {
    region = "us-east-1"
}
````
* The following block in **main.tf** creates an S3 bucket:
````bash
resource "aws_s3_bucket" "aws-terraform-state-1" {
    bucket = "aws-terraform-state-1"

    lifecycle {
        prevent_destroy = true
    }

    versioning {
        enabled = true
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}
````
