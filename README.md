# Rivery Inter-Region Peering

This repository contains example configurations for establishing VPC peering between your VPC and a dedicated VPC for PrivateLink access to Rivery in a supported region.

## Terminology
- **Requester**: Refers to the newly created VPC where an NLB (Network Load Balancer) should be set up to function as the PrivateLink endpoint for Rivery.
- **Accepter**: Refers to the VPC that will access the source databases and other resources.

## Getting Started
**Important:** On the first run, you must set the input variable `INIT` to `true`. This is necessary because the stack will fail if the VPC has not yet been created. Setting the `INIT` flag ensures that only the VPC is created during this initial step.

## Usage Note
**Important:** This is a sample configuration intended as a reference. Please thoroughly review and adjust the configuration to align with your specific requirements.
In order to run this configuration - support a tfvars file in the following fashion:

##input.tfvars:
name                  = "Rivery_PL_vpc"
pl_vpc_cidr_block     = "172.26.30.0/24"
region                = "eu-west-1"
accepter_vpc_id       = "vpc-abcdabcd1234234"
accepter_region       = "us-east-2"
accepter_cidr         = "10.45.0.0/16"
accepter_route_tables = ["rtb-AFAFAFAFAF123123123", "rtb-FEFEFEFE1231231231", "rtb-BCBCBCBC123123123"]

# init = true

**To run use:** terraform <action> --var-file=input.tfvars
