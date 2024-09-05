resource "aws_key_pair" "public_key" {
    key_name = var.key_name
    public_key = var.public_key_file
}