// Both providers use the default AWS creds

// AWS east 1
provider "aws" {
  region = "us-east-1"
  alias  = "east"
}

// AWS west 1
provider "aws" {
  region = "us-west-1"
  alias  = "west"
}

// Using module for getting latest Ubuntu image and creating EC2 instances in two different regions.

// Creating Ubuntu EC2 in us-east-1
module "ec2_east" {
  source = "./ec2_module"
  providers = {
    aws = aws.east
  }
}

// Creating Ubuntu EC2 in us-west-1
module "ec2_west" {
  source = "./ec2_module"
  providers = {
    aws = aws.west
  }
}

