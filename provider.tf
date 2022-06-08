
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "terraform" {
  name     = "terraform-resources"
  location = var.location
}
