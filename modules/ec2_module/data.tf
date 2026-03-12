
data "aws_ami" "aws_linux" { # Filter the characteristics of the AMI, configure to your desires.
  most_recent = true         # Use most recent version.
  owners      = ["amazon"]

  filter { # Use Amazon Linux 2023 and filter most recent version of AMI 2023.
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter { # Use EBS volume as the storage type and filter to most recent version.
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter { # Use hardware virtual machine and filter most recent version.
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
