# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

output "vpc" {
  value = aws_vpc.main
}

output "internet_gateway" {
  value = aws_internet_gateway.main
}

output "security_group_vpc_endpoint_interface" {
  value = aws_security_group.vpc_endpoint_interface
}