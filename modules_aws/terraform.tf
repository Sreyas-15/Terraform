# resource "aws_instance" "web" {
#   #   ami           = "ami-0de716d6197524dd9"
#   instance_type = var.instance_type
#   //ami                    = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
#   // used data source to capture the latest amazon ubuntu ami id for first run ;later hardcode it from state file
#   ami = "ami-0de716d6197524dd9"
#   #   key_name               = aws_key_pair.ec2-key.key_name
#   #   vpc_security_group_ids = [aws_security_group.multi_service.id]

#   tags = {
#     Name = "myfirst_aws_instance"
#   }
# }

module "mywebserver" {
  source = "./modules/webserver"
}