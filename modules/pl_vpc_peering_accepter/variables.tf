variable "requester_peering_connection_id" {
  description = "Peering connection ID of the peer created in the requester VPC."
  type        = string
}

variable "requester_cidr" {
  description = "CIDR range of the requester VPC, required to set up routing."
  type        = string
}

variable "accepter_route_tables" {
  description = "Route tables ID's from the accepters side VPC, required to set up routing."
  type        = list(string)
}

variable "name" {
  description = "Name to tag the created peering with. This will help quickly identify the peers in console."
  type        = string
}