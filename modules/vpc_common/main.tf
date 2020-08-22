module "vpc_common" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"
  name    = "VPC-${var.tags["Product"]}-${var.tags["Environment"]}"

  cidr                 = var.vpc_cidr_block
  azs                  = var.azs
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"
  tags                 = var.tags
  # https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/2.44.0#nat-gateway-scenarios
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
}
