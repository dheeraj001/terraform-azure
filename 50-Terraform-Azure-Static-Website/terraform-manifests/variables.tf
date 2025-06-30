variable "location" {
  description = "The Azure Region in which all the resources group should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "storage_account_tier" {
  description = "Storage Account tier"
  type        = string
}

variable "storage_account_replication_type" {
  description = "Storage account replication type"
  type        = string
}

variable "storage_account_kind" {
  description = "Storage Account Kind"
  type        = string
}

variable "static_website_index_document" {
  description = "Static Webstite index document"
  type        = string
}

variable "static_website_error_404_document" {
  description = "Static Website error 404 document"
  type        = string
}