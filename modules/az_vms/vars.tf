variable "resouce_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_name" {
  type = string
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}