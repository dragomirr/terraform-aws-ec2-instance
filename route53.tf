resource "aws_route53_record" "this" {
  count = length(var.route53_record)

  name    = lookup(var.route53_record[count.index], "name")
  zone_id = lookup(var.route53_record[count.index], "zone_id")
  type    = lookup(var.route53_record[count.index], "type", "A")
  ttl     = lookup(var.route53_record[count.index], "ttl", 3600)
  records = var.create_eip ? [aws_eip.this[0].public_ip] : [aws_instance.this.public_ip]
}