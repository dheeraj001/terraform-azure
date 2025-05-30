variable "business_unit" {
  description = "Business unit name"
  type        = string
  default     = "hr"
}

variable "environment" {
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
}

variable "common_tags" {
  description = "Common Tags for Azure Resources"
  type = map(string)
  default = {
    "CLITool" = "Terraform"
    "Tag1" = "Azure"
  } 
}

variable "db_name" {
    description = "Azure MySQL Database DB Name"
    type = string  
}

variable "db_username" {
    description = "Azure MySQL Database Administrator Username"  
    type = string
    sensitive = true
}

variable "db_password" {
    description = "Azure MySQL Database Administrator Password"
    type = string
    sensitive = true
}

variable "db_storage_mb" {
  description = "Azure MySQL Database Storage in MB"
  type = number
}

variable "db_auto_grow_enabled" {
    description = "Azure MySQL Database - Enable or Disable Auto Grow Feature"
    type = bool
}

variable "tdpolicy" {
  description = "Azure MySQL DB Threat Detection Policy"
  type = object({
    enable = bool
    retention_days = number
    email_account_admins = bool
    email_address = list(string)
  })
  
}