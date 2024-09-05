resource "aws_vpc_security_group_egress_rule" "allow_all_egress" {
  security_group_id = aws_security_group.Allow_http_ssh.id
  ip_protocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}