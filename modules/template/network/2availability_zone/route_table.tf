# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "aws_route_table" "public_2az" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
  tags = {
    Name = "${var.account_name}-vpc-route-table-public-2az"
  }
}

resource "aws_route_table" "private_1a_2az" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main_1a_2az.id
  }
  tags = {
    Name = "${var.account_name}-vpc-route-table-private-1a-2az"
  }
}

resource "aws_route_table" "private_1c_2az" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main_1c_2az.id
  }
  tags = {
    Name = "${var.account_name}-vpc-route-table-private-1c-2az"
  }
}

resource "aws_route_table_association" "public_1a_2az" {
  route_table_id = aws_route_table.public_2az.id
  subnet_id      = aws_subnet.public_1a_2az.id
}

resource "aws_route_table_association" "public_1c_2az" {
  route_table_id = aws_route_table.public_2az.id
  subnet_id      = aws_subnet.public_1c_2az.id
}

resource "aws_route_table_association" "private_1a_2az" {
  route_table_id = aws_route_table.private_1a_2az.id
  subnet_id      = aws_subnet.private_1a_2az.id
}

resource "aws_route_table_association" "private_1c_2az" {
  route_table_id = aws_route_table.private_1c_2az.id
  subnet_id      = aws_subnet.private_1c_2az.id
}