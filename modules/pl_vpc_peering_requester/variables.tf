variable "requester_vpc_id" {
  description = "VPC ID where we are initiating this peering request."
  type        = string
}


variable "accepter_vpc_id" {
  description = "VPC ID of the target VPC. This is where the accepter will be initiated after this requester is configured."
  type        = string
}


variable "accepter_region" {
  description = "Region of the target VPC."
  type        = string
}

variable "name" {
  description = "Name to tag the created peering with. This will help quickly identify the peers in console."
  type        = string
}

variable "requester_route_tables" {
  description = "Route table IDs in the requester side VPC. This is required to configure routing."
  type        = list(string)
}

variable "accepter_cidr" {
  description = "CIDR range of the target VPC. This is required to configure routing."
  type        = string
}