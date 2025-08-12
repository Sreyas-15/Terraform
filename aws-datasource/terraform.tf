data "aws_ami" "myami" {
#   executable_users = ["self"]
  most_recent      = true
#   name_regex       = "^myami-[0-9]{3}"
  owners           = ["amazon"]

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_owner" {
  value = data.aws_ami.myami.owner_id
}
output "amiid" {
  value = data.aws_ami.myami.name
}