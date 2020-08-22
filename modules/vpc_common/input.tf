variable "environment" {
  description = "The name of the environment. For example: 'qa'"
}

variable "vpc_cidr_block" {
  description = "The CIDR of the VPC. For example: '172.16.0.0/16'"
}

variable "azs" {
  type        = list(string)
  description = "A list of the AWS Availability Zones. For Example: ['us-east1a', 'us-east1b']"
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of the Private Subnets. For example: ['172.16.0.0/24', '172.16.1.0/24']"
}

variable "public_subnets" {
  description = "A list of the Public Subnets. For example: ['172.16.2.0/24', '172.16.3.0/24']"
  type        = list(string)
}

variable "tags" {
  description = "A dictionary of AWS Tags. For Example: { Name = 'qa'}"
}