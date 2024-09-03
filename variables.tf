variable "init" {
  description = "Must run with flag set for first run. (ONLY create VPC which is a dependancy)"
  type        = bool
  default     = false
}

variable "name" {
  type    = string
  default = "Rivery_PL_vpc"
}

variable "pl_vpc_cidr_block" {
  type    = string
  default = "172.27.30.0/24"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "accepter_vpc_id" {
  type = string
}

variable "accepter_region" {
  type = string
}

variable "accepter_cidr" {
  type = string
}


