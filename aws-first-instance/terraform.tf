resource "aws_key_pair" "ec2-key" {
  # creating ssh key
  key_name   = "EC2-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "web" {
  #   ami           = "ami-0de716d6197524dd9"
  instance_type = "t3.nano"
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  key_name      = aws_key_pair.ec2-key.key_name
  tags = {
    Name = "myfirst_aws_instance"
  }
}