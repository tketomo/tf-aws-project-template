# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement
# available at http://aws.amazon.com/agreement or other written agreement
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

module "network_main" {
  source         = "../../modules/template/network"
  account_name   = local.account_name
  vpc_cidr_block = local.vpc_cidr_block
}

// FIXME: 2AZ構成にする場合にはnetwork_2azを、3AZ構成にする場合にはnetwork_3azのコメントアウトを解除してください。
//module "network_2az" {
//  source                                      = "../../modules/template/network/2availability_zone"
//  account_name                                = local.account_name
//  vpc_cidr_block                              = module.network_main.vpc.cidr_block
//  vpc_id                                      = module.network_main.vpc.id
//  internet_gateway_id                         = module.network_main.internet_gateway.id
//  vpc_endpoint_logs_security_group_ids        = [module.network_main.security_group_vpc_endpoint_interface.id]
//  vpc_endpoint_monitoring_security_group_ids  = [module.network_main.security_group_vpc_endpoint_interface.id]
//  vpc_endpoint_ssm_security_group_ids         = [module.network_main.security_group_vpc_endpoint_interface.id]
//  vpc_endpoint_ssmmessages_security_group_ids = [module.network_main.security_group_vpc_endpoint_interface.id]
//  vpc_endpoint_ec2messages_security_group_ids = [module.network_main.security_group_vpc_endpoint_interface.id]
//}
//
//module "network_3az" {
//  source                                      = "../../modules/template/network/3availability_zone"
//  account_name                                = local.account_name
//  vpc_cidr_block                              = module.network_main.vpc.cidr_block
//  vpc_id                                      = module.network_main.vpc.id
//  internet_gateway_id                         = module.network_main.internet_gateway.id
//  vpc_endpoint_logs_security_group_ids        = [module.network_main.security_group_vpc_endpoint_interface.id]
//  vpc_endpoint_monitoring_security_group_ids  = [module.network_main.security_group_vpc_endpoint_interface.id]
//  vpc_endpoint_ssm_security_group_ids         = [module.network_main.security_group_vpc_endpoint_interface.id]
//  vpc_endpoint_ssmmessages_security_group_ids = [module.network_main.security_group_vpc_endpoint_interface.id]
//  vpc_endpoint_ec2messages_security_group_ids = [module.network_main.security_group_vpc_endpoint_interface.id]
//}

module "budget" {
  source       = "../../modules/template/budget"
  account_name = local.account_name
  subscriber_email_addresses = [
    local.user_email_address,
    local.management_email_address,
  ]
}

module "security_hub" {
  source      = "../../modules/template/security_hub"
  account_id  = local.account_id
  region_name = local.region_name
}