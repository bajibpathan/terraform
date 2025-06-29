variable "security_group_ids" {
  default =  ["sg-0d72167c5d5dfcb1b"]
}

variable "tags" {
    default = {
        Name = "roboshop-cart"
        Terraform = "true"
        Envrironment = "dev"
    }
}

variable "instance_type" {
    default = "t3.small"
}