locals {
  resource_name_prefix = "${var.namespace}-${var.resource_tag_name}"

  lambda_topic_name = "${local.resource_name_prefix}-${var.topic_name}-lambda"
  sqs_topic_name    = "${local.resource_name_prefix}-${var.topic_name}-sqs"
}

resource "aws_sns_topic" "lambda" {
  count = var.lambda_sns_topic ? 1 : 0

  name = local.lambda_topic_name

  lambda_success_feedback_role_arn    = var.lambda_success_feedback_role_arn
  lambda_failure_feedback_role_arn    = var.lambda_failure_feedback_role_arn
  lambda_success_feedback_sample_rate = var.lambda_success_feedback_sample_rate

  tags = {
    Environment = var.namespace
    Name        = var.resource_tag_name
  }
}

resource "aws_sns_topic" "sqs" {
  count = var.sqs_sns_topic ? 1 : 0

  name = local.sqs_topic_name

  sqs_success_feedback_role_arn    = var.sqs_success_feedback_role_arn
  sqs_failure_feedback_role_arn    = var.sqs_failure_feedback_role_arn
  sqs_success_feedback_sample_rate = var.sqs_success_feedback_sample_rate

  tags = {
    Environment = var.namespace
    Name        = var.resource_tag_name
  }
}
