provider "aws" {

    region = "us-east-1"

}

terraform {
   backend "s3" {
       bucket = "aws-terraform-state-1"
       key = "dev/web-server/terraform.tfstate"
       region = "us-east-1"

       dynamodb_table = "my-terraform-locks"
       encrypt = true
   }
}


# launching aws ec2 instance ( Ubuntu Server 22.04 LTS )
resource "aws_instance" "dev-web-srv-1" {

    ami                     = "ami-007855ac798b5175e"
    instance_type           = "t2.micro"

    tags = {
        Name = "dev-web-srv-1"
    }
}
