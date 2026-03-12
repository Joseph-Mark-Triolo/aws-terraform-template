# Add whatever variables are needed
environment   = "prod"
aws_region    = "your-desired-region" # this line is unnecessary since aws region is set in terraform-action.yml as a github secret, use this line if you are deploying to multiple regions and reflect changes in the action.
instance_type = "desired-instance-type"
key_name      = "ec2-key-pair"
