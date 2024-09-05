module "sg-01" {
    source = "../../modules/security_groups"
    sg_name = "allow_dev"
}

module "key_pair" {
  source = "../../modules/ec2_key_pair"
  key_name = "dev-key"
  public_key_file = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC/pUthCapS4JEvG5zzIbdX5EiXH+xVJ8M4x4U22ubtnEeeYjyxgsZW1C08X8EUrQWZ08QohMnmj9cfBBqFbQph62C7/XP8GyqMlrmP8LnO6JfOQ2wm8svV4R2ZYfNC+0Wg3WT3sIRXWbcshydslx4pMCVHfpr6aTIfG8r8/qfiYJq/BE7WOV2H2wzfbJvR7O5B0QTxbKPaYx0RfgUL8dc8Ek9vz2bvimB3ysmQyI5fzPIrwxhPGYBtj5Vq8uSO8s+aeQ79sYhZVzJK5BYGpkX7Ehp6QzUpmiZw+4KWbLaPTjSHYc3gAOs8FX1CBPZzXhT01AExGGYKfkNXxofQTSU++qcips0k0nBzyfwND8Xeu889CLlrfk7tSxGEaLufnpe7t3lotcy1HUp+Q1l05zoJbJFBddG5INvSqz+3FhrJ0tH1e6ZgcytAETmLWudkn1Ikibm7HlTjL98oFOn/ZaIAn3jhmuEiUv3Xwr2WCAV86RyeKM2Yqeqq+bMbPXt4aJM= scarmona@pc-sebas"
}

module "ec2_instances_dev" {
  source = "../../modules/ec2_instances"
  id_sg = module.sg-01.sg_id
  key_pair_name = module.key_pair.key_pair
  instances = {
    "dev-wordpress" = {
      ami_id = "ami-0e86e20dae9224db8"
      instance_size = "t2.micro"
      instance_name = "dev-wordpress"
    }
    "dev-mysql" = {
      ami_id = "ami-0e86e20dae9224db8"
      instance_size = "t2.micro"
      instance_name = "dev-mysql"
    }
  }
}



