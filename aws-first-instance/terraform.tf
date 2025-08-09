resource "aws_instance" "web" {
#   ami           = "ami-0de716d6197524dd9"
  instance_type = "t3.nano"
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"

  tags = {
    Name = "myfirst_aws_instance"
  }
}