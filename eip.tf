resource "aws_eip" "this" {
  count    = var.create_eip ? 1 : 0
  vpc      = true

  tags = merge(var.tags, tomap({"Resource" = "eip"}))
}

resource "aws_eip_association" "eip_assoc" {
  count                = var.create_eip ? 1 : 0
  network_interface_id = aws_network_interface.this.id
  allocation_id        = aws_eip.this[0].id
}
