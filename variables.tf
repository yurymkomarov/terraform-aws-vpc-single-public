terraform {
  experiments = [variable_validation]
}

variable "name" {
  type        = string
  description = "Name that will be used in resources names and tags."
  default     = "terraform-aws-vpc-single-public"
}

variable "create_vpc" {
  type        = bool
  description = "Create personal VPC."
  default     = true
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC."
  default     = "10.0.0.0/16"

  validation {
    condition     = can(regex("^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(1[6-9]|2[0-8]))$", var.cidr_block))
    error_message = "CIDR block parameter must be in the form x.x.x.x/16-28."
  }
}

variable "flow_log_enable" {
  type    = bool
  description = "Enable Flow Log for VPC."
  default = true
}

variable "flow_log_destination" {
  type        = string
  description = "Provides a VPC/Subnet/ENI Flow Log to capture IP traffic for a specific network interface, subnet, or VPC."
  default     = "cloudwatch"

  validation {
    condition     = contains(["cloudwatch", "s3"], var.flow_log_destination)
    error_message = "Logs can be sent only to a CloudWatch Log Group or a S3 Bucket."
  }
}
