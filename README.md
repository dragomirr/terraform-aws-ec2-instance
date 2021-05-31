## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.32.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip_association.eip_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_network_interface.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | The AMI to use for the instance. | `string` | n/a | yes |
| <a name="input_cpu_credits"></a> [cpu\_credits](#input\_cpu\_credits) | Customize the credit specification of the instance. Possible values: standard or unlimited | `string` | `"standard"` | no |
| <a name="input_create_eip"></a> [create\_eip](#input\_create\_eip) | Whathever to create ot not Elastic IP. | `bool` | `false` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | If true, enables EC2 Instance Termination Protection. | `bool` | `false` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | If true, the launched EC2 instance will be EBS-optimized. | `bool` | `true` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance. | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The key name of the Key Pair to use for the instance. | `string` | `null` | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | If true, the launched EC2 instance will have detailed monitoring enabled. | `bool` | `false` | no |
| <a name="input_placement_group"></a> [placement\_group](#input\_placement\_group) | The Placement Group to start the instance in. | `string` | `null` | no |
| <a name="input_root_block_device_encrypted"></a> [root\_block\_device\_encrypted](#input\_root\_block\_device\_encrypted) | Should root block device be encrypted | `bool` | `true` | no |
| <a name="input_root_block_device_size"></a> [root\_block\_device\_size](#input\_root\_block\_device\_size) | Size of instance root volume. By default if this is null, AWS sets default root volume size. | `number` | `null` | no |
| <a name="input_root_block_device_volume_type"></a> [root\_block\_device\_volume\_type](#input\_root\_block\_device\_volume\_type) | Root block volume type.  Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. | `string` | `"gp3"` | no |
| <a name="input_route53_record"></a> [route53\_record](#input\_route53\_record) | Route53 setting for instance. | <pre>list(object({<br>    name    = string<br>    zone_id = string<br>    type    = string<br>    ttl     = number<br>  }))</pre> | `[]` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security groups instance will be part of. | `list(string)` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID to create the ENI in. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Instance tags. | `map` | `{}` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user\_data\_base64 instead. | `string` | `null` | no |
| <a name="input_user_data_base64"></a> [user\_data\_base64](#input\_user\_data\_base64) | Can be used instead of user\_data to pass base64-encoded binary data directly. Use this instead of user\_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption. | `string` | `null` | no |
| <a name="input_volume_tags"></a> [volume\_tags](#input\_volume\_tags) | A map of tags to assign to the devices created by the instance at launch time. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance"></a> [instance](#output\_instance) | Instance output |
