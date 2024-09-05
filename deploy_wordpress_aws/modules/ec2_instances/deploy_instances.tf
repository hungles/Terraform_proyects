resource "aws_instance" "this" {
    for_each = var.instances
    ami = each.value["ami_id"]
    instance_type = each.value["instance_size"]
    tags = {
      Name = each.value["instance_name"]
    }
    vpc_security_group_ids = [var.id_sg]
    key_name = var.key_pair_name
}

