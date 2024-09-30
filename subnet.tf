# #create subnet
# resource "aws_subnet" "terraform-subnet" {
#   vpc_id     = aws_vpc.terraform-vpc.id
#   cidr_block = var.subnet_block

#   tags = {
#     Name = var.subnet_name
#   }
# }
# #create routeTable
# resource "aws_route_table" "terrfaorm-routeTable" {
#   vpc_id = aws_vpc.terraform-vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   route {
#     ipv6_cidr_block = "::/0"
#     gateway_id      = aws_internet_gateway.gw.id
#   }

#   tags = {
#     Name = var.route-table-name
#   }
# }



