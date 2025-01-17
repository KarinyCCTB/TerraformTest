resource "aws_security_group" "allow_all" { 
	vpc_id = aws_vpc.main.id 
	ingress { 
		from_port = 80 
		to_port = 80 
		protocol = "tcp" 
		cidr_blocks = ["0.0.0.0/0"] 
	}
	ingress { 
		from_port = 22 
		to_port = 22 
		protocol = "tcp" 
		cidr_blocks = ["0.0.0.0/0"] 
	}
	egress { 
		from_port = 0 
		to_port = 0 
		protocol = "-1" # Allow all traffic 
		cidr_blocks = ["0.0.0.0/0"] # Allow outbound traffic 
	}
	tags = { 
		Name = "Allow All Security Group"
	}
}
