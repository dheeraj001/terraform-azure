variable "business_unit" {
  description = "Business unit name"
  type        = string
  default     = "hr"
}

variable "Environment" {
  description = "Environment Name"
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
  default     = "myrg"
}

variable "resource_group_location" {
  description = "Resouce grouo location"
  type        = string
  default     = "East Us"
}

variable "virtual_network_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "myvnet"

}

variable "virtual_subnet" {
  description = "Virtual Network subnet name"
  type        = string
}

variable "virtual_network_address_space" {
  description = "Virtual Network  Address Space"
  type        = list(string)
  default     = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]

}