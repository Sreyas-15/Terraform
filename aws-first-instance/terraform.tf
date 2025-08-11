data "aws_vpc" "default" {
  default = true
}
resource "aws_key_pair" "ec2-key" {
  # creating ssh key
  key_name   = "EC2-key"
  public_key = file("${path.module}/id_rsa.pub")

}


resource "aws_security_group" "multi_service" {
  name        = "multi_service"
  description = "Allow multiple service inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "multi_service"
  }
}

# Ingress rules for IPv4 and IPv6 (loop per service)
resource "aws_vpc_security_group_ingress_rule" "allow_ipv4" {
  for_each = var.services

  security_group_id = aws_security_group.multi_service.id
  cidr_ipv4 = "0.0.0.0/0"   // allows all traffic from internet
  # cidr_ipv4         = data.aws_vpc.default.cidr_block  allows only your vpc trafic

  #  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port   = each.value
  to_port     = each.value
  ip_protocol = "tcp"
}

# resource "aws_vpc_security_group_ingress_rule" "allow_ipv6" {
#   for_each = var.services

#   security_group_id = aws_security_group.multi_service.id
#   # cidr_ipv6         = aws_vpc.main.ipv6_cidr_block
#   cidr_ipv6 = data.aws_vpc.default.ipv6_cidr_block

#   from_port         = each.value
#   to_port           = each.value
#   ip_protocol       = "tcp"
# }

# Egress rules - one for IPv4, one for IPv6
resource "aws_vpc_security_group_egress_rule" "allow_all_ipv4" {
  security_group_id = aws_security_group.multi_service.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_ipv6" {
  security_group_id = aws_security_group.multi_service.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}


resource "aws_instance" "web" {
  #   ami           = "ami-0de716d6197524dd9"
  instance_type          = "t3.nano"
  //ami                    = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  // used data source to capture the latest amazon ubuntu ami id for first run ;later hardcode it from state file
  ami                                  = "ami-0de716d6197524dd9"
  key_name               = aws_key_pair.ec2-key.key_name
  vpc_security_group_ids = [aws_security_group.multi_service.id]

  tags = {
    Name = "myfirst_aws_instance"
  }
}