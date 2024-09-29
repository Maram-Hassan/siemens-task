
output "vpc_id" {
  value = aws_vpc.terraform-vpc.id
}
output "instance_ip" {
  value = aws_instance.your_instance_name.public_ip
}

