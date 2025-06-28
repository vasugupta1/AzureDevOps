variable "resouce_group_name" {
  type = string
  default = "az-204"
}

variable "location" {
  type = string
  default = "West Europe"
}

variable "function_app_name" {
  type = string
  default = "samplefunctionapp"
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}