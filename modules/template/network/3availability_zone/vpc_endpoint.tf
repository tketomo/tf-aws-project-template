# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "aws_vpc_endpoint" "s3" {
  service_name = "com.amazonaws.ap-northeast-1.s3"
  vpc_id       = var.vpc_id
  tags = {
    Name = "${var.account_name}-vpc-endpoint-s3"
  }
}

resource "aws_vpc_endpoint" "logs" {
  service_name        = "com.amazonaws.ap-northeast-1.logs"
  vpc_id              = var.vpc_id
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.vpc_endpoint_logs_security_group_ids
  subnet_ids = [
    aws_subnet.private_1a_3az.id,
    aws_subnet.private_1d_3az.id,
    aws_subnet.private_1c_3az.id,
  ]
  tags = {
    Name = "${var.account_name}-vpc-endpoint-logs"
  }
}

resource "aws_vpc_endpoint" "monitoring" {
  service_name        = "com.amazonaws.ap-northeast-1.monitoring"
  vpc_id              = var.vpc_id
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.vpc_endpoint_monitoring_security_group_ids
  subnet_ids = [
    aws_subnet.private_1a_3az.id,
    aws_subnet.private_1d_3az.id,
    aws_subnet.private_1c_3az.id,
  ]
  tags = {
    Name = "${var.account_name}-vpc-endpoint-monitoring"
  }
}

resource "aws_vpc_endpoint" "ssm" {
  service_name        = "com.amazonaws.ap-northeast-1.ssm"
  vpc_id              = var.vpc_id
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.vpc_endpoint_ssm_security_group_ids
  subnet_ids = [
    aws_subnet.private_1a_3az.id,
    aws_subnet.private_1d_3az.id,
    aws_subnet.private_1c_3az.id,
  ]
  tags = {
    Name = "${var.account_name}-vpc-endpoint-ssm"
  }
}

resource "aws_vpc_endpoint" "ssmmessages" {
  service_name        = "com.amazonaws.ap-northeast-1.ssmmessages"
  vpc_id              = var.vpc_id
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.vpc_endpoint_ssmmessages_security_group_ids
  subnet_ids = [
    aws_subnet.private_1a_3az.id,
    aws_subnet.private_1d_3az.id,
    aws_subnet.private_1c_3az.id,
  ]
  tags = {
    Name = "${var.account_name}-vpc-endpoint-ssmmessages"
  }
}

resource "aws_vpc_endpoint" "ec2messages" {
  service_name        = "com.amazonaws.ap-northeast-1.ec2messages"
  vpc_id              = var.vpc_id
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  security_group_ids  = var.vpc_endpoint_ec2messages_security_group_ids
  subnet_ids = [
    aws_subnet.private_1a_3az.id,
    aws_subnet.private_1d_3az.id,
    aws_subnet.private_1c_3az.id,
  ]
  tags = {
    Name = "${var.account_name}-vpc-endpoint-ec2messages"
  }
}

resource "aws_vpc_endpoint_route_table_association" "s3_private_1a_3az" {
  route_table_id  = aws_route_table.private_1a_3az.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

resource "aws_vpc_endpoint_route_table_association" "s3_private_1d_3az" {
  route_table_id  = aws_route_table.private_1d_3az.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

resource "aws_vpc_endpoint_route_table_association" "s3_private_1c_3az" {
  route_table_id  = aws_route_table.private_1c_3az.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}