## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.95.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.bia](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.terraform-bia-db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_iam_instance_profile.role_acesso_ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.role_acesso_ssm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.attach_admin_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.attach_ssm_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.bia-dev](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.bia-alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.bia-db](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.bia-ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.bia_dev](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Tipo da instância EC2 | `string` | `"bia-dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_security_group_id"></a> [aws\_security\_group\_id](#output\_aws\_security\_group\_id) | ID do grupo de segurança |
| <a name="output_aws_security_group_name"></a> [aws\_security\_group\_name](#output\_aws\_security\_group\_name) | Nome do grupo de segurança |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | ID da instância EC2 |
| <a name="output_instance_private_ip"></a> [instance\_private\_ip](#output\_instance\_private\_ip) | IP privado da instância EC2 |
| <a name="output_instance_public_ip"></a> [instance\_public\_ip](#output\_instance\_public\_ip) | IP público da instância EC2 |
| <a name="output_instance_type"></a> [instance\_type](#output\_instance\_type) | Tipo da instância EC2 |
| <a name="output_instance_type_rds"></a> [instance\_type\_rds](#output\_instance\_type\_rds) | Tipo da instância RDS BIA |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | Endpoint do banco de dados RDS |
| <a name="output_rds_secrets"></a> [rds\_secrets](#output\_rds\_secrets) | Secrets do banco de dados RDS BIA |
