# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "aws_securityhub_standards_subscription" "cis" {
  standards_arn = "arn:aws:securityhub:::ruleset/cis-aws-foundations-benchmark/v/1.2.0"
}

resource "aws_securityhub_standards_control" "cis" {
  standards_control_arn = "arn:aws:securityhub:${var.region_name}:${var.account_id}:control/cis-aws-foundations-benchmark/v/1.2.0/1.10"
  control_status        = "DISABLED"
  disabled_reason       = "The CIS Is Not Required"
  depends_on = [
    aws_securityhub_standards_subscription.cis
  ]
}