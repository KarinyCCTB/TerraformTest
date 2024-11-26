resource "aws_vpc" "main" { 
	cidr_block = "10.0.0.0/16" # CIDR block for the VPC 
	enable_dns_support = true 
	enable_dns_hostnames = true 
	tags = {
		Name = "Main VPC"
	}
}

resource "aws_internet_gateway" "main_igw" { 
	vpc_id = aws_vpc.main.id 
	tags = { 
		Name = "Main Internet Gateway"
	}
}

resource "aws_route_table" "public" { 
	vpc_id = aws_vpc.main.id 
	route { 
		cidr_block = "0.0.0.0/0" 
		gateway_id = aws_internet_gateway.main_igw.id
	}
	tags = { 
		Name = "Public Route Table"
	}
}

resource "aws_subnet" "prod" { 
	vpc_id = aws_vpc.main.id 
	cidr_block = "10.0.1.0/24" 
	availability_zone = "us-east-1a" 
	map_public_ip_on_launch = true 
	tags = {
		Name = "Public Subnet 1 (Production)"
	}
}

resource "aws_subnet" "test" { 
	vpc_id = aws_vpc.main.id 
	cidr_block = "10.0.2.0/24" 
	availability_zone = "us-east-1b" 
	map_public_ip_on_launch = true 
	tags = {
		Name = "Public Subnet 2 (Testing)"
	}
}

resource "aws_subnet" "staging" { 
	vpc_id = aws_vpc.main.id 
	cidr_block = "10.0.3.0/24" 
	availability_zone = "us-east-1c" 
	map_public_ip_on_launch = true 
	tags = {
		Name = "Public Subnet 3 (Staging)"
	}
}

resource "aws_route_table_association" "prod_subnet_association" { 
	subnet_id = aws_subnet.prod.id 
	route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "test_subnet_association" { 
	subnet_id = aws_subnet.test.id 
	route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "staging_subnet_association" { 
	subnet_id = aws_subnet.staging.id 
	route_table_id = aws_route_table.public.id
}
