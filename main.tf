locals {
  resource_name_prefix = "${var.namespace}-${var.resource_tag_name}"

  lambda_topic_name = "${local.resource_name_prefix}-${var.topic_name}-lambda"
  sqs_topic_name    = "${local.resource_name_prefix}-${var.topic_name}-sqs"
}

# -----------------------------------------------------------------------------
# Variables: Lambda integration
# -----------------------------------------------------------------------------
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

resource "aws_sns_topic_subscription" "lambda" {
  count = var.lambda_sns_topic ? 1 : 0

  topic_arn = aws_sns_topic.lambda.arn
  protocol  = "lambda"
  endpoint  = var.lambda_function_arn
}

resource "aws_lambda_permission" "lambda" {
  count = var.lambda_sns_topic ? 1 : 0
  
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_arn
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.lambda.arn
}

# -----------------------------------------------------------------------------
# Variables: SQS integration
# -----------------------------------------------------------------------------
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

resource "aws_sns_topic_subscription" "sqs" {
  count = var.sqs_sns_topic ? 1 : 0

  topic_arn = aws_sns_topic.sqs.arn
  protocol  = "sqs"
  endpoint  = var.sqs_arn
}

resource "aws_sqs_queue_policy" "_" {
  count = var.sqs_sns_topic ? 1 : 0

  queue_url = var.sqs_id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${var.sqs_arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.sqs.arn}"
        }
      }
    }
  ]
}
POLICY
}