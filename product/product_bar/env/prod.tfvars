region                          = "us-east-1"
#This 'profile' is to set which AWS credentials profile to use.
profile                         = "prod"
environment                     = "prod"
vpc_cidr_block                  = "172.16.0.0/16"
azs                             = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets                 = ["172.16.0.0/24", "172.16.1.0/24", "172.16.2.0/24"]
public_subnets                  = ["172.16.3.0/24", "172.16.4.0/24", "172.16.5.0/24"]