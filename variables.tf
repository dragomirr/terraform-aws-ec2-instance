variable ami {
  description = "The AMI to use for the instance."
  type        = string
}

variable instance_type {
  description = "The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
  type        = string
}

variable subnet_id {
  description = "Subnet ID to create the ENI in."
  type        = string
}

variable iam_instance_profile {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  type        = string
  default     = null
}

variable security_groups {
  description = "List of security groups instance will be part of."
  type        = list(string)
  default     = null
}

variable create_eip {
  description = "Whathever to create ot not Elastic IP."
  type        = bool
  default     = false
}

variable key_name {
  description = "The key name of the Key Pair to use for the instance."
  type        = string
  default     = null
}

variable cpu_credits {
  description = "Customize the credit specification of the instance. Possible values: standard or unlimited"
  type        = string
  default     = "standard"

  validation {
    condition = (
      var.cpu_credits == "standard" || var.cpu_credits == "unlimited"
    )
    error_message = "The cpu_credits variable allowed values are \"standard\" or \"unlimited\"."
  }
}

variable tags {
  description = "Instance tags."
  type        = map
  default     = {}
}

variable volume_tags {
  description = "A map of tags to assign to the devices created by the instance at launch time."
  type        = map(string)
  default     = null
}

variable ebs_optimized {
  description = "If true, the launched EC2 instance will be EBS-optimized."
  type        = bool
  default     = true
}

variable disable_api_termination {
  description = "If true, enables EC2 Instance Termination Protection."
  type        = bool
  default     = false
}

variable monitoring {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled."
  type        = bool
  default     = false
}

variable placement_group {
  description = "The Placement Group to start the instance in."
  type        = string
  default     = null
}

variable root_block_device_size {
  description = "Size of instance root volume. By default if this is null, AWS sets default root volume size."
  type        = number
  default     = null
}

variable root_block_device_volume_type {
  description = "Root block volume type.  Valid values include standard, gp2, gp3, io1, io2, sc1, or st1."
  type        = string
  default     = "gp3"

  validation {
    condition     = can(regex("^standard$|^gp[23]$|^io[12]$|^s[ct]1$", var.root_block_device_volume_type))
    error_message = "Valid values include standard, gp2, gp3, io1, io2, sc1, or st1."
  }
}

variable root_block_device_encrypted {
  description = "Should root block device be encrypted"
  type        = bool
  default     = true
}

variable route53_record {
  description = "Route53 setting for instance."
  type        = list(object({
    name    = string
    zone_id = string
    type    = string
    ttl     = number
  }))
  default     = []
}

variable user_data {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  type        = string
  default     = null
}

variable user_data_base64 {
  description = "Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption."
  type        = string
  default     = null
}
