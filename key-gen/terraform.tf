resource "aws_key_pair" "ec2-key" {
  # creating ssh key
  key_name   = "EC2-key"
  public_key = file("${path.module}/id_rsa.pub")
}