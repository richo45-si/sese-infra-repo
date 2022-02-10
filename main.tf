module "vpc" {
    source = "./modules/vpc"
    cidr   = "10.0.0.0/16"
    cider  = "10.0.0.0/24"
}

module "elasticbeanstalk" {
  source = "./modules/elasticbeanstalk"
  name   = "sese"
  #value1 = module.vpc.id
  #value2 = module.vpc.subnet.id

  #depends_on = [module.vpc]
    
}
