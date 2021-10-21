# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "aws_subnet" "public_1a_3az" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 4, 12)
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "${var.account_name}-vpc-subnet-public-1a-3az"
  }
}

resource "aws_subnet" "public_1d_3az" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 4, 13)
  availability_zone = "ap-northeast-1d"
  tags = {
    Name = "${var.account_name}-vpc-subnet-public-1b-3az"
  }
}

resource "aws_subnet" "public_1c_3az" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 4, 14)
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "${var.account_name}-vpc-subnet-public-1c-3az"
  }
}

resource "aws_subnet" "private_1a_3az" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 2, 0)
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "${var.account_name}-vpc-subnet-private-1a-3az"
  }
}

resource "aws_subnet" "private_1d_3az" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 2, 1)
  availability_zone = "ap-northeast-1d"
  tags = {
    Name = "${var.account_name}-vpc-subnet-private-1b-3az"
  }
}

resource "aws_subnet" "private_1c_3az" {
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 2, 2)
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "${var.account_name}-vpc-subnet-private-1c-3az"
  }
}