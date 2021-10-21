# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "aws_security_group" "vpc_endpoint_interface" {
  name        = "${var.account_name}-vpc-security-group-vpc-endpoint-interface"
  description = "For VPC Endpoint Interface"
  vpc_id      = aws_vpc.main.id
  ingress {
    description = "Inbound Rule For VPC"
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = [aws_vpc.main.cidr_block]
  }
  tags = {
    Name = "${var.account_name}-vpc-security-group-vpc-endpoint-interface"
  }
}

resource "aws_security_group" "ec2" {
  name        = "${var.account_name}-vpc-security-group-ec2"
  description = "For EC2"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "${var.account_name}-vpc-security-group-ec2"
  }
}

resource "aws_security_group_rule" "ec2" {
  description       = "Inbound Rule For Self"
  from_port         = 0
  protocol          = -1
  security_group_id = aws_security_group.ec2.id
  to_port           = 0
  type              = "ingress"
  self              = true
}