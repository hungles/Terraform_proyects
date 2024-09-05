resource "aws_security_group" "Allow_http_ssh" {
    name = var.sg_name
    vpc_id = var.vpc_id

    tags = {
      name = "allow_http_ssh"
    }
}