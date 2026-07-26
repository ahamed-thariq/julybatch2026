variable "security_group_id" {
    type = string
    description = "The ID of the security group"
}

variable "subnet_id" {
    type = string
    description = "The ID of the subnet in which to launch the EC2 instance"
}