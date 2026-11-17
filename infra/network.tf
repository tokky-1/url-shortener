data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_vpc" "vpc_name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.url_vpc
  }
  enable_dns_hostnames = true
}

resource "aws_subnet" "url_pub_subnet" {
  vpc_id     = aws_vpc.vpc_name.id
  count      = 2
  cidr_block = cidrsubnet(aws_vpc.vpc_name.cidr_block, 8, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.url_subnet}-${count.index}"
  }
   availability_zone = data.aws_availability_zones.available.names[count.index]

}

resource "aws_internet_gateway" "url_gate" {
  vpc_id = aws_vpc.vpc_name.id
  tags = {
    Name = var.url_int_gate
  }
}

resource "aws_route_table" "url_route_tb" {
  vpc_id = aws_vpc.vpc_name.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.url_gate.id
  }

   tags = {
    Name = var.url_route
  }
}
resource "aws_route_table_association" "url_route_tb_public" {
  count = 2
  subnet_id      = aws_subnet.url_pub_subnet[count.index].id
  route_table_id = aws_route_table.url_route_tb.id
}
