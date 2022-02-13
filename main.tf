module "vpc" {
    source = "./modules/vpc"
    cidr   = "10.0.0.0/16"
    cider1  = "10.0.2.0/24"
    cider2  = "10.0.1.0/24"
}

module "elasticbeanstalk" {
source = "./modules/elasticbeanstalk"
vpc_id              = "vpc-0e2e383fe921b5493"
#Instance_type       = "t2.micro"
#minsize             = 1
#maxsize             = 2
public_subnets     = ["subnet-07728c15454400c29", "subnet-021106e67be426a1e"] 
elb_public_subnets = ["subnet-07728c15454400c29", "subnet-021106e67be426a1e"] 
tier = "WebServer"
solution_stack_name = "64bit Amazon Linux 2 v3.3.10 running PHP 8.0"
}


