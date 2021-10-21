# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

output "subnet_private_1a_3az_cidr_block" {
  value = aws_subnet.private_1a_3az.cidr_block
}

output "subnet_private_1d_3az_cidr_block" {
  value = aws_subnet.private_1d_3az.cidr_block
}

output "subnet_private_1c_3az_cidr_block" {
  value = aws_subnet.private_1c_3az.cidr_block
}