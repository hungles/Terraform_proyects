output "dev-public_ips" {
  description = "Las IPs públicas de las instancias EC2"
  value = module.ec2_instances_dev.public_ips
}