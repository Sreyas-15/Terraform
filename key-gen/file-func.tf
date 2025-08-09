output "printfile" {
  value = "${path.module}/id_rsa.pub"
}

output "keyname" {
  value = aws_key_pair.ec2-key.key_name
}