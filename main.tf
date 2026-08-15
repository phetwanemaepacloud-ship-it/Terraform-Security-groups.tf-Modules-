# Security group for EC2 Instance Connect Endpoint 
resource "aws_security_group" "eice_security_group" {
  name = "${var.environment)-${var.project_name}-eice-sg" 
  description = "Outbound SSH to VPC CIDR"
  vpc_id      = var.vpc_id

egress {
  from_port = 22
  to_port - 22
  protocol = "tcp"
  cidr_blocks = [var.vpc_cidr]
}

tags {
  Name = "${var.environment)-${var.project_name}-eice-sg"
  } 
} 

# Security group for Application Load Balancer 
resource "aws_security_group" "alb_security_group" {
  name         = "${var.environment]-${var.project_name}-alb-sg" 
  description  = "HTTP/HTTPS from internet"
  vpc_id       = aws_vpc.vpc.id

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


egress (
  from_port = 0 
  to_port   = 0
  protocol = -1
  cidr_blocks = ["0.0.0.0/0"]
} 


tags = {
Name = "${var.environment)-${var.project_name}-alb-sg"
} 


# Security group for Application Load Balancer 
resource "aws_security_group" "alb_security_group" {
  name        = "${var.environment)-${var.project_name}-alb-sg" 
  description = "HTTP/HTTPS from internet"
  vpc_id      = var.vpc_id
  
ingress {
  description = "HTTP 
  from_port   = 80 
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

ingress {
  description = "HTTPS"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]


egress {
  from_port   = 0
  to_port     = 0
  protocol    = -1
  cidr_blocks = ["0.0.0.0/0"]
} 

tags =
  Name = "${var.environment)-${var.project_name}-alb-sg"
  } 
} 


# Security group for Application Load Balancer 
resource "aws_security_group" "alb_security_group" {
  name        = "${var.environment)-${var.project_name}-alb-sg" 
  description = "HTTP/HTTPS from internet"
  vpc_id      = var.vpc_id
  
ingress {
  description = "HTTP 
  from_port   = 80 
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

ingress {
  description = "HTTPS"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]


egress {
  from_port   = 0
  to_port     = 0
  protocol    = -1
  cidr_blocks = ["0.0.0.0/0"]
} 

tags =
  Name = "${var.environment)-${var.project_name}-alb-sg"
  } 
} 

# Security group for Application server (ECS, EC2) 
resource "aws_security_group" "alb_security_group" {
  name        = "${var.environment)-${var.project_name}-alb-sg" 
  description = "HTTP/HTTPS from ALB, SSH from Eice" 
  vpc_id      = var.vpc_id
  
ingress {
  description     = "SSH from EICE" 
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  security_groups = aws_security_group.eice_security_group.id

ingress {
  description     = "HTTP from ALB"
  from_port       = 88
  to_port         = 88
  protocol        = "tcp"
  security_groups = aws_security_group.alb_security_group.id

egress {
  from_port   = 0
  to_port     = 0
  protocol    = -1
  cidr_blocks = ["0.0.0.0/0"]
} 

tags =
  Name = "${var.environment)-${var.project_name}-alb-sg"
  } 
} 
