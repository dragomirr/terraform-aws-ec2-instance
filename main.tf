resource "aws_instance" "this" {
  ami                     = var.ami
  instance_type           = var.instance_type
  iam_instance_profile    = var.iam_instance_profile
  ebs_optimized           = var.ebs_optimized
  disable_api_termination = var.disable_api_termination
  monitoring              = var.monitoring
  placement_group         = var.placement_group
  key_name                = var.key_name
  user_data               = var.user_data
  user_data_base64        = var.user_data_base64
  volume_tags             = var.volume_tags

  root_block_device {
    volume_type           = var.root_block_device_volume_type
    volume_size           = var.root_block_device_size
    encrypted             = var.root_block_device_encrypted
    delete_on_termination = true
  }

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  network_interface {
    network_interface_id = aws_network_interface.this.id
    device_index         = 0
  }

  tags = merge(var.tags, tomap({"Resource" = "instance"}))

  lifecycle {
    ignore_changes = [ami, user_data, volume_tags]
  }

  depends_on = [aws_network_interface.this]
}
