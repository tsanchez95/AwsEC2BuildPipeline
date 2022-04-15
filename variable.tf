variable "region" {
  description = "Region used for the provider"
  default     = "us-east-1"
}

variable "instance_profile" {
  default = "name-name-instance-role"
}

variable "kms_key_id"{
  default = "arn:aws:kms:us-east-1:"
}
