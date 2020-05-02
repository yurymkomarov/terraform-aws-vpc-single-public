output "vpc" {
  value = try(aws_vpc.this[0], data.aws_vpc.default)
}

output "subnet" {
  value = try(aws_subnet.public, data.aws_subnet.default)
}

output "security_group" {
  value = try(aws_security_group.this[0], data.aws_security_group.default)
}
