# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "aws_eip" "main_1a_2az" {
  vpc = true
  tags = {
    Name = "${var.account_name}-vpc-eip-main-1a-2az"
  }
}

resource "aws_eip" "main_1c_2az" {
  vpc = true
  tags = {
    Name = "${var.account_name}-vpc-eip-main-1c-2az"
  }
}