output "instance" {
  value       = aws_instance.this
  description = "Instance output" 
}

output "eip" {
  value       = aws_eip.this
  description = "EIP output"
}
