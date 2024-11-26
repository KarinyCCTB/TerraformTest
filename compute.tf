resource "aws_instance" "production_1" { 
	ami = "ami-0453ec754f44f9a4a" # Provided AMI ID 
	instance_type = "t2.micro" 
	subnet_id = aws_subnet.prod.id 
	key_name = aws_key_pair.devops_key.key_name 
	security_groups = [aws_security_group.allow_all.id] 
	tags = {
		Name = "Production_Env1"
	}
}

resource "aws_instance" "production_2" { 
	ami = "ami-0453ec754f44f9a4a" # Provided AMI ID 
	instance_type = "t2.micro" 
	subnet_id = aws_subnet.prod.id 
	key_name = aws_key_pair.devops_key.key_name 
	security_groups = [aws_security_group.allow_all.id] 
	tags = {
		Name = "Production_Env2"
	}
}

resource "aws_instance" "jenkins_controller" { 
	ami = "ami-0453ec754f44f9a4a" # Provided AMI ID 
	instance_type = "t2.micro" 
	subnet_id = aws_subnet.staging.id 
	key_name = aws_key_pair.devops_key.key_name 
	security_groups = [aws_security_group.allow_all.id] 
	tags = {
		Name = "JenkinsController"
	}
}

resource "aws_instance" "testing_env" { 
	ami = "ami-0453ec754f44f9a4a" # Provided AMI ID 
	instance_type = "t2.micro" 
	subnet_id = aws_subnet.test.id 
	key_name = aws_key_pair.devops_key.key_name 
	security_groups = [aws_security_group.allow_all.id] 
	tags = {
		Name = "Testing_Env"
	}
}

resource "aws_instance" "staging_env" { 
	ami = "ami-0453ec754f44f9a4a" # Provided AMI ID 
	instance_type = "t2.micro" 
	subnet_id = aws_subnet.staging.id 
	key_name = aws_key_pair.devops_key.key_name 
	security_groups = [aws_security_group.allow_all.id] 
	tags = {
		Name = "Staging_Env"
	}
}
