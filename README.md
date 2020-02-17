# Terraform AWS SNS topic module

## About:

Support SNS topic creation for AWS Lambda and SQS, use the boolean variables ```lambda_sns_topic``` and ```sqs_sns_topic``` to enable any of them. By default only lambda is enabled.

If we want feedback logging(success and failure), provide the policy ARN that the integration can use to log on CloudWatch.

## How to use:

By default it will only create an AWS lambda integration SNS topic, so we don't have to specify:

```terraform
module "sns" {
  source = "github.com/rpstreef/tf-sns-topic?ref=v1.0"

  namespace         = var.namespace
  region            = var.region
  resource_tag_name = var.resource_tag_name

  topic_name   = local.sns_topic_name
}
```

## Changelog:

### v1.0

Initial release