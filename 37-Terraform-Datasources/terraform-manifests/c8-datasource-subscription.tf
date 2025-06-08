data "azurerm_subscription" "current" {
  
}

output "ds_azure_subscription_name" {
    value = data.azurerm_subscription.current.display_name
  
}

output "ds_azure_subscription_id" {
    value = data.azurerm_subscription.current.id
  
}

output "ds_azure_subscription_spending_limit" {
    value = data.azurerm_subscription.current.spending_limit
  
}