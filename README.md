# AWS VPC with a single public subnet

The configuration for this scenario includes a virtual private cloud (VPC) with a single public subnet, and an internet gateway to enable communication over the internet.

We recommend this configuration if you need to run a single-tier, public-facing web application, such as a blog or a simple website.

## Overview

The following diagram shows the key components of the configuration for this module:

![The following diagram shows the key components of the configuration for this module](/images/diagram.png?raw=true)

The configuration for this module includes the following:

- A virtual private cloud (VPC) with a size /16 IPv4 CIDR block (example: 10.0.0.0/16). This provides 65,536 private IPv4 addresses.
- A subnet with a size /24 IPv4 CIDR block (example: 10.0.0.0/24). This provides 256 private IPv4 addresses.
- An internet gateway. This connects the VPC to the internet and to other AWS services.
- A custom route table associated with the subnet. The route table entries enable instances in the subnet to use IPv4 to communicate with other instances in the VPC, and to communicate directly over the internet. A subnet that's associated with a route table that has a route to an internet gateway is known as a public subnet.
