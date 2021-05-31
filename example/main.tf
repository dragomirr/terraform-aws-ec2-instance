provider "aws" {
  region = "eu-central-1"

  profile = "smartocto"
}

data "aws_vpc" "vpc" {
  default = true
}

data "aws_subnet_ids" "subnets" {
  vpc_id = data.aws_vpc.vpc.id
}

module "ec2_instance" {
  source = "../"

  # REQUIRED
  ami           = "ami-0c2b1c303a2e4cb49"
  instance_type = "t3.micro"
  subnet_id     = tolist(data.aws_subnet_ids.subnets.ids)[0]

  # OPTIONAL
  cpu_credits                   = "standard"
  create_eip                    = false
  disable_api_termination       = false
  ebs_optimized                 = true
  iam_instance_profile          = null
  key_name                      = null
  monitoring                    = false
  placement_group               = null
  root_block_device_encrypted   = true
  root_block_device_size        = null
  root_block_device_volume_type = "gp3"
  route53_record                = []
  security_groups               = null
  tags                          = {}
  user_data                     = null
  user_data_base64              = null
}
