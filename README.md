# Rivery Inter-Region Peering

This repository contains example configurations for establishing VPC peering between your VPC and a dedicated VPC for PrivateLink access to Rivery in a supported region.

## Terminology
- **Requester**: Refers to the newly created VPC where an NLB (Network Load Balancer) should be set up to function as the PrivateLink endpoint for Rivery.
- **Accepter**: Refers to the VPC that will access the source databases and other resources.

## Getting Started
**Important:** On the first run, you must set the input variable `INIT` to `true`. This is necessary because the stack will fail if the VPC has not yet been created. Setting the `INIT` flag ensures that only the VPC is created during this initial step.

## Usage Note
**Important:** This is a sample configuration intended as a reference. Please thoroughly review and adjust the configuration to align with your specific requirements.
