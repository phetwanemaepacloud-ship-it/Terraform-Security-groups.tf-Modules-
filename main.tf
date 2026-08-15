# Security group for EC2 Instance Connect Endpoint 
resource "aws_security_group" "eice_security_group" {
  name = "${var.environment)-${var.project_name}-eice-sg" 
  description = "Outbound SSH to VPC CIDR"
  vpc_id      = var.vpc_id

egress {
  from_port = 22
  to_port - 22
  protocol = "tcp"
  cidr_blocks = []
}

tags {
  Name = "${var.environment)-${var.project_name}-eice-sg"
  } 
} 

# Security group for Application Load Balancer 
resource "aws_security_group" "alb_security_group" {
  name         = "${var.environment]-${var.project_name}-alb-sg" 
  description  = "HTTP/HTTPS from internet"
  vpc_id       = 

ingress {
  description = "HTTP"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"
  cidr_blocks= ["0.0.0.0/0"]
} 

ingress {
description = "HTTPS"
from_port   = 443
to_port     = 443 
protocol    = "tcp" 
cidr_block  = ["0.0.0.0/0"] ID.
