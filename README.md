#  Storing Terrafrom State Files to AWS S3

## Shared Storage for state files
### Storing Terraform state in version control have the following concerns.
#### Manual Error
> Can forget to pull down the latest changes(latest version state file) from version control before running terraform or to push your latest changes to version control after running Terraform.
#### Locking
> Can't prevent two team members from running terraform apply on the same state file at the same time because most version control systems do not provide any form of locking.
#### Secrets
> All data in Terraform state files including sensitive data. Storing plain-text secrets anywhere is a bad idea, including version control.


