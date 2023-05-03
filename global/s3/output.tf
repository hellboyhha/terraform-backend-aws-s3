output "s3_bucket_arn" {
    value = aws_s3_bucket.aws-terraform-state-1.arn
    description = "The ARN of the s3 bucket"
}

output "dynamodb_table_name" {
    value = aws_dynamodb_table.aws-terraform-locks-1.name
    description = "The name of the DynamoDB table"
}
