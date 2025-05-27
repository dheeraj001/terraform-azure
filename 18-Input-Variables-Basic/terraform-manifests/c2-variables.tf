variable "business_unit" {
  description = "Business unit name"
  type        = string
  default     = "hr"
}

variable "Environmnet" {
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
  description = "Vritaul Network Name"
  type        = string
  default     = "myvnet"

}