output "public_ips" {
  value = {
    for instance in aws_instance.this :
    instance.id => instance.public_ip
  }
}