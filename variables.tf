# -----------------------------------------------------------------------------
# Variables: General
# -----------------------------------------------------------------------------

variable "namespace" {
  description = "AWS resource namespace/prefix"
}

variable "region" {
  description = "AWS region"
}

variable "resource_tag_name" {
  description = "Resource tag name for cost tracking"
}

# -----------------------------------------------------------------------------
# Variables: SNS
# -----------------------------------------------------------------------------
variable "topic_name" {
  description = "Name of the SNS topic"
}

# -----------------------------------------------------------------------------
# Variables: Lambda integration
# -----------------------------------------------------------------------------
variable "lambda_sns_topic" {
  description = "Lambda integration point for this SNS topic"
  type        = bool
  default     = true
}

variable "lambda_function_arn" {
  description = "Lambda function ARN"
  type        = string
  default     = null
}

variable "lambda_success_feedback_role_arn" {
  description = "IAM Role for success feedback CloudWatch logs"
  type        = string
  default     = null
}

variable "lambda_failure_feedback_role_arn" {
  description = "IAM Role for failure feedback CloudWatch logs"
  type        = string
  default     = null
}

variable "lambda_success_feedback_sample_rate" {
  description = "Success feedback sample rate between 0 and 1"
  type        = number
  default     = null
}

# -----------------------------------------------------------------------------
# Variables: SQS Integration
# -----------------------------------------------------------------------------
variable "sqs_sns_topic" {
  description = "Lambda integration point for this SNS topic"
  type        = bool
  default     = false
}

variable "sqs_id" {
  description = "SQS ID"
  type        = string
  default     = null
}

variable "sqs_arn" {
  description = "SQS ARN"
  type        = string
  default     = null
}

variable "sqs_success_feedback_role_arn" {
  description = "IAM Role for success feedback CloudWatch logs"
  type        = string
  default     = null
}

variable "sqs_failure_feedback_role_arn" {
  description = "IAM Role for failure feedback CloudWatch logs"
  type        = string
  default     = null
}

variable "sqs_success_feedback_sample_rate" {
  description = "Success feedback sample rate between 0 and 1"
  type        = number
  default     = null
}