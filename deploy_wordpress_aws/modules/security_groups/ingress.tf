resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.Allow_http_ssh.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  to_port     = 80
  from_port = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.Allow_http_ssh.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  to_port     = 22
  from_port = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_rdp" {
  security_group_id = aws_security_group.Allow_http_ssh.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  to_port     = 3389
  from_port = 3389
}