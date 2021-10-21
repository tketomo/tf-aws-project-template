# ディレクトリ構成
```
.
├── README.md
├── modules
│   └── template
│        ├── budget
│        │   ├── budget.tf
│        │   └── variables.tf
│        ├── network
│        │   ├── 2availability_zone
│        │   │   ├── elastic_ip.tf
│        │   │   ├── nat_gateway.tf
│        │   │   ├── outputs.tf
│        │   │   ├── route_table.tf
│        │   │   ├── subnet.tf
│        │   │   ├── variables.tf
│        │   │   └── vpc_endpoint.tf
│        │   ├── 3availability_zone
│        │   │   ├── elastic_ip.tf
│        │   │   ├── nat_gateway.tf
│        │   │   ├── outputs.tf
│        │   │   ├── route_table.tf
│        │   │   ├── subnet.tf
│        │   │   ├── variables.tf
│        │   │   └── vpc_endpoint.tf
│        │   ├── internet_gateway.tf
│        │   ├── outputs.tf
│        │   ├── security_group.tf
│        │   ├── variables.tf
│        │   ├── vpc.tf
│        │   └── vpc_flow_log.tf
│        └── security_hub
│            ├── security_hub.tf
│            └── variables.tf
└── projects
    └── initial
        ├── backend.tf
        ├── data.tf
        ├── locals.tf
        ├── main.tf
        └── provider.tf
```
## modulesディレクトリ
Terraformリソースファイルが格納されているディレクトリになります。Terraformを実行するにあたり、原則こちらのディレクトリ内のTerraformファイルは変更の必要のない想定です。

## projects/initialディレクトリ
Terraform Moduleを呼び出し実行するためのディレクトリになります。Terraformを実行する前に、以下のファイルについて変更を加える必要があります。
### backend.tf
```hcl
terraform {
  backend "s3" {
    region = "ap-northeast-1"
    bucket = "<Input Bucket Name>"
    key    = "<Input Key>/terraform.tfstate"
  }
}
```
- `<Input Bucket Name>`: tfstateファイルを格納するBucket名を指定する部分。適切なBucket名を入力してください。
- `<Input Key>`: 上記で指定したBucketにKeyを指定します。適切なKeyを入力してください。
### locals.tf
```hcl
locals {
  account_id               = data.aws_caller_identity.current.account_id
  account_name             = "<Input Account Name>"
  region_name              = data.aws_region.current.name
  vpc_cidr_block           = "<Input VPC Cidr Block>"
  user_email_address       = "<Input User Email>"
  management_email_address = "aws-root@group.lightvortex.com"
}
```
- `<Input Account Name>`: 該当AWSアカウントの名前を入力する部分。適切な名前を入力してください。この変数は各リソースの命名に利用されます。
- `<Input VPC Cidr Block>`: 作成するVPC Cidrを指定する部分。e.g. 10.1.128.0/24
- `<Input User Email>`: 該当AWSカウントの利用ユーザのEmail Addressを入力する部分。
### main.tf
```hcl
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
```