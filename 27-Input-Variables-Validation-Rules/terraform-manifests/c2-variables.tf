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
  default     = "eastus2"
  validation {
    # condition     = var.resource_group_location == "eastus" || var.resource_group_location == "eastus2"
    # condition     = contains(["eastus", "eastus2"], var.resource_group_location)
    # error_message = "We only allow Resources to be created in eastus and eastus2 locations."
    condition     = can(regex("india$", var.resource_group_location))
    error_message = "We only allow Resources to be created in southindia and westindia locations."
  }
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

variable "public_ip_sku" {
  description = "Azure public ip address sku"
  type        = map(string)
  default = {
    "eastus"  = "Basic",
    "eastus2" = "Standard"
  }
}

variable "common_tags" {
  description = "Common tags for azure resource"
  type        = map(string)
  default = {
    "CLITool" = "Terraform",
    "Tag1"    = "Azure"
  }
}

