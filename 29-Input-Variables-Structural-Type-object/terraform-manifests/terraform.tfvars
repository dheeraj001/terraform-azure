# Generic Variables
business_unit = "it"
environment  = "dev"

# Resource Group Variables
resource_group_name  = "rg"
resource_group_location  = "eastus2"

# DB Variables
db_name = "mydb205"
db_storage_mb = 5120
db_auto_grow_enabled = true

tdpolicy = {
  enable = true
  retention_days = 10
  email_account_admins = true
  email_address = [ "a1dheerajnegi@gmail.com", "dheerajnegi43@gmail.com" ]

}