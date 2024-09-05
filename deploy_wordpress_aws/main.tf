module "dev_deploy" {
    source = "./enviroments/dev"
}

module "prod_deploy" {
    source = "./enviroments/prod"
}

output "prod_public_ips" {
  value = join("\n", values(module.prod_deploy.prod-public_ips))
}

output "dev_public_ips" {
  value = join("\n", values(module.dev_deploy.dev-public_ips))
}

resource "local_file" "ansible_inventory" {
  content  = <<EOF
[wordpress]
${join(" ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa\n", values(module.prod_deploy.prod-public_ips))} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
[mysql]
${join(" ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa\n", values(module.dev_deploy.dev-public_ips))} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
EOF
  filename = "${path.module}/inventory.ini"
}