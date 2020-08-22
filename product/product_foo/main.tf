terraform {
  backend "s3" {
    encrypt = true
    # The following values are passed in via "backend-config={env}.backend.tfvars"
    # bucket
    # key
    # region
    # profile
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

locals {
  # These are the AWS Tags that every item should have.
  tags = {
    Name        = "product_foo-${var.environment}"
    Environment = var.environment
    Terraform   = "True"
    Product     = "product_foo"
  }
}

module "vpc_common" {
  source          = "../../modules/vpc_common"
  azs             = var.azs
  environment     = var.environment
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  vpc_cidr_block  = var.vpc_cidr_block
  tags            = local.tags
}


data "aws_ami" "latest-ubuntu-trusty" {
most_recent = true
owners = ["099720109477"] # Canonical

  filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}

resource "aws_instance" "test_instance" {
  count = 2
  ami = data.aws_ami.latest-ubuntu-trusty.id
  instance_type = "t2.nano"
  subnet_id = module.vpc_common.private_subnets_ids[0]
}