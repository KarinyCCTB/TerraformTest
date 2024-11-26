resource "aws_lb" "prod_lb" { 
	name = "prod-lb" 
	internal = false 
	load_balancer_type = "application" 
	security_groups = [aws_security_group.allow_all.id] 
	subnets = [aws_subnet.prod.id, aws_subnet.test.id] 
	enable_deletion_protection = false 
	tags = {
		Name = "prod-lb"
	}
}

resource "aws_lb_target_group" "prod_target_group" { 
	name = "prod-target-group" 
	port = 80 
	protocol = "HTTP" 
	vpc_id = aws_vpc.main.id 
	health_check {
		path = "/" 
		interval = 30 
		timeout = 5 
		healthy_threshold = 3 
		unhealthy_threshold = 3
	}
}

resource "aws_lb_listener" "prod_lb_listener" { 
	load_balancer_arn = aws_lb.prod_lb.arn 
	port = 80 
	protocol = "HTTP" 
	default_action {
		type = "fixed-response" 
		fixed_response { 
			status_code = 200 
			content_type = "text/plain" 
			message_body = "OK"
		}
	}
}

resource "aws_lb_target_group_attachment" "prod_target_attachment_1" { 
	target_group_arn = aws_lb_target_group.prod_target_group.arn 
	target_id = aws_instance.production_1.id 
	port = 80
}

resource "aws_lb_target_group_attachment" "prod_target_attachment_2" { 
	target_group_arn = aws_lb_target_group.prod_target_group.arn 
	target_id = aws_instance.production_2.id 
	port = 80
}
