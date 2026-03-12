variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az1_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "az2_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.2.0/24"
}

variable "az3_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.3.0/24"
}
variable "environment" {}
