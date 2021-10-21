# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "aws_nat_gateway" "main_1a_3az" {
  allocation_id = aws_eip.main_1a_3az.id
  subnet_id     = aws_subnet.public_1a_3az.id
  tags = {
    Name = "${var.account_name}-vpc-nat-gateway-main-1a-3az"
  }
}

resource "aws_nat_gateway" "main_1d_3az" {
  allocation_id = aws_eip.main_1b_3az.id
  subnet_id     = aws_subnet.public_1d_3az.id
  tags = {
    Name = "${var.account_name}-vpc-nat-gateway-main-1d-3az"
  }
}

resource "aws_nat_gateway" "main_1c_3az" {
  allocation_id = aws_eip.main_1c_3az.id
  subnet_id     = aws_subnet.public_1c_3az.id
  tags = {
    Name = "${var.account_name}-vpc-nat-gateway-main-1c-3az"
  }
}