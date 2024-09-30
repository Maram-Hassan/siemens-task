resource "aws_instance" "TerraformInstance" {
   ami                         = "ami-0ebfd941bbafe70c6" # Ubuntu Server 20.04 LTS (Free Tier eligible in us-east-1)
  instance_type               = "t2.medium"   
  subnet_id                   = aws_subnet.terraform-subnet.id
  associate_public_ip_address = true
   key_name                    = "ansible-ec2-key" # Add this line

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]

  tags = {
    Name = "TerraformInstance"
  }
}

# resource "aws_security_group" "allow_http_ssh" {
#   name        = "allow_http_ssh"
#   description = "Security group to allow HTTP and SSH traffic"
#   vpc_id      = aws_vpc.terraform-vpc.id # Associate with the correct VPC

#   # Ingress rules (incoming traffic)
#   ingress {
#     description = "Allow HTTP (IPv4)"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"

#     cidr_blocks = ["0.0.0.0/0"] # Allows HTTP traffic from any IPv4 address
#   }

#   ingress {
#     description      = "Allow HTTP (IPv6)"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     ipv6_cidr_blocks = ["::/0"] # Allows HTTP traffic from any IPv6 address
#   }

#   tags = {
#     Name = "allow_http_ssh"
#   }
# }



resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Security group to allow HTTP, custom port 8081, and SSH traffic"
  vpc_id      = aws_vpc.terraform-vpc.id # Associate with the correct VPC

  # Ingress rules (incoming traffic)
  
  # Allow HTTP traffic
  ingress {
    description = "Allow HTTP (IPv4)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"] # Allows HTTP traffic from any IPv4 address
  }

  # Allow custom port 8081
  ingress {
    description = "Allow Custom Port 8081 (IPv4)"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"] # Allows traffic on port 8081 from any IPv4 address
  }

  # Allow SSH traffic
  ingress {
    description = "Allow SSH (IPv4)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"] # Allows SSH traffic from any IPv4 address
  }


  tags = {
    Name = "allow_http_ssh"
  }
}

# Associate subnet with route table

