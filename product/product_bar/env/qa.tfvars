region                          = "us-east-1"
#This 'profile' is to set which AWS credentials profile to use.
profile                         = "qa"
environment                     = "qa"
vpc_cidr_block                  = "172.17.0.0/16"
azs                             = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets                 = ["172.17.0.0/24", "172.17.1.0/24", "172.17.2.0/24"]
public_subnets                  = ["172.17.3.0/24", "172.17.4.0/24", "172.17.5.0/24"]