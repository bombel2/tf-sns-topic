output "sns_topic_arn_lambda" {
  value = join("", aws_sns_topic.lambda[*].arn)
}

output "sns_topic_arn_sqs" {
  value = join("", aws_sns_topic.sqs[*].arn)
}

output "lambda_topic_name" {
  value = local.lambda_topic_name
}

output "sqs_topic_name" {
  value = local.sqs_topic_name
}