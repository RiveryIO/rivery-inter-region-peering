provider "aws" {
  alias   = "requester"
  region  = var.region
  profile = "management"
}

provider "aws" {
  alias   = "accepter"
  region  = var.accepter_region
  profile = "management"
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "pl_vpc" {
  providers = {
    aws.requester = aws.requester
  }
  source          = "terraform-aws-modules/vpc/aws"
  name            = var.name
  cidr            = var.pl_vpc_cidr_block
  azs             = data.aws_availability_zones.available.names
  private_subnets = [for k, v in data.aws_availability_zones.available.names : cidrsubnet(var.pl_vpc_cidr_block, 4, k)]

  map_public_ip_on_launch = false
  enable_nat_gateway      = false
  single_nat_gateway      = false
  enable_dns_hostnames    = true
  enable_flow_log         = false

  # if this is for production use, protect this VPC from destruction.
  # lifecycle {
  #   prevent_destroy = true
  # }

}

# Must target out this module until VPC has already been created
module "peering_requester" {
  count = var.init ? 0 : 1
  providers = {
    aws.requester = aws.requester
  }
  source = "./modules/pl_vpc_peering_requester"

  requester_vpc_id       = module.pl_vpc.vpc_id
  accepter_vpc_id        = var.accepter_vpc_id
  accepter_region        = var.accepter_region
  requester_route_tables = length(module.pl_vpc.private_route_table_ids) > 0 ? module.pl_vpc.private_route_table_ids : []
  accepter_cidr          = var.accepter_cidr
  name                   = var.name

  depends_on = [module.pl_vpc]
}