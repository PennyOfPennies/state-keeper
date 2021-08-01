output "s3_bucket_arn" {
  value       = module.terraform_state_keeper.s3_bucket_arn
  description = "The ARN of the S3 bucket"
}
output "dynamodb_table_name" {
  value       = module.terraform_state_keeper.dynamodb_table_name
  description = "The name of the DynamoDB table"
}