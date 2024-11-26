variable "region" { 
	description = "AWS region" 
	default = "us-east-1"
}

variable "vpc_cidr" { 
	description = "CIDR block for the VPC" 
	default = "10.0.0.0/16"
}

variable "subnet_cidr_prod" { 
	description = "CIDR block for production subnet" 
	default = "10.0.1.0/24"
}

variable "subnet_cidr_test" { 
	description = "CIDR block for testing subnet" 
	default = "10.0.2.0/24"
}

variable "subnet_cidr_staging" { 
	description = "CIDR block for staging subnet" 
	default = "10.0.3.0/24"
}

variable "key_name" { 
	description = "The EC2 Key Pair name" 
	type = string
}
