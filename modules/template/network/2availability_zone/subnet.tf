# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "aws_subnet" "public_1a_2az" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 3, 4)
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "${var.account_name}-vpc-subnet-public-1a-2az"
  }
}

resource "aws_subnet" "public_1c_2az" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 3, 5)
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "${var.account_name}-vpc-subnet-public-1c-2az"
  }
}

resource "aws_subnet" "private_1a_2az" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 2, 0)
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "${var.account_name}-vpc-subnet-private-1a-2az"
  }
}

resource "aws_subnet" "private_1c_2az" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 2, 1)
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "${var.account_name}-vpc-subnet-private-1c-2az"
  }
}