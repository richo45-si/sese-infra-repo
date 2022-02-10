resource "aws_elastic_beanstalk_application" "demo" {
  name        = var.name
  description = "test beanstalk"
}

resource "aws_elastic_beanstalk_environment" "demo1" {
  name                = "demo"
  application         = aws_elastic_beanstalk_application.demo.name
  solution_stack_name = "64bit Amazon Linux 2 v3.3.10 running PHP 8.0"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-038420905e47fbed9" 
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-0c5868822f6f59a62" 
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role" 
  }
}