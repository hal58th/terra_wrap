// Don't ever, ever touch this unless you are the only one doing it and you know what you are doing.
// The terraform state file is not remote, so the terraform.tfstate must be committed after you do your change.

provider "aws" {
  region  = "us-east-1"
  profile = "qa"
  alias   = "qa"
}

provider "aws" {
  region  = "us-east-1"
  profile = "prod"
  alias   = "prod"
}

module "qa_s3_tfstate" {
  source      = "../../modules/s3_tfstate"
  providers   = { aws = aws.qa }
  # Bucket name needs to be unique
  bucket_name = "terraform-tfstate-qa-abc123qwe"
}

module "prod_s3_tfstate" {
  source      = "../../modules/s3_tfstate"
  providers   = { aws = aws.prod }
  # Bucket name needs to be unique
  bucket_name = "terraform-tfstate-prod-abc123qwe"
}