# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

variable "account_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "vpc_endpoint_logs_security_group_ids" {
  type = list(string)
}

variable "vpc_endpoint_monitoring_security_group_ids" {
  type = list(string)
}

variable "vpc_endpoint_ssm_security_group_ids" {
  type = list(string)
}

variable "vpc_endpoint_ssmmessages_security_group_ids" {
  type = list(string)
}

variable "vpc_endpoint_ec2messages_security_group_ids" {
  type = list(string)
}