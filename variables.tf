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
variable "lambda_sns_topic" {
  description = "Lambda integration point for this SNS topic"
  type        = bool
  default     = true
}

variable "sqs_sns_topic" {
  description = "Lambda integration point for this SNS topic"
  type        = bool
  default     = false
}

variable "topic_name" {
  description = "Name of the SNS topic"
}

# -----------------------------------------------------------------------------
# Variables: CloudWatch logging optional
# -----------------------------------------------------------------------------
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