
module "aws_vpc" { # Module to make a custom VPC
  source      = "./modules/vpc_module"
  environment = var.environment
}

module "aws_ec2_instance" { # This is the module that will make a EC2 on the default VPC, make your own VPC and put the EC2 on there
  source        = "./modules/ec2_module"
  environment   = var.environment
  vpc_id        = module.aws_vpc.vpc_id
  subnet_id     = module.aws_vpc.subnet_ids
  instance_type = var.instance_type
  key_name      = var.key_name
}

module "aws_s3_bucket" { # This module will make an S3 Bucket with your desired objects
  source      = "./modules/s3_module"
  bucket_name = "name-of-bucket-you-want-to-make" # Needs to be GLOBALLY unique
  file_path   = "modules/s3_module/object_files/path-to-files"
  environment = var.environment
}
