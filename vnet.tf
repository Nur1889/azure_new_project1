# terraform {
#   backend "azurerm" {
#     resource_group_name  = "StorageAccount-ResourceGroup"
#     storage_account_name = var.storage_account_name
#     container_name       = "tfstate"
#     key                  = "path/to/my/key/prod.terraform.tfstate"
#     access_key = var.access_key
#   }
# }




# # Configure the Microsoft Azure Provider
# provider "azurerm" {
#   features {}
# }


resource "azurerm_network_security_group" "terraform" {
  name                = "terraform-security-group"
  location            = azurerm_resource_group.terraform.location
  resource_group_name = azurerm_resource_group.terraform.name
}
resource "azurerm_network_security_rule" "terraform" {
  name                        = "test123"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.terraform.name
  network_security_group_name = azurerm_network_security_group.terraform.name
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "terraform" {
  name                = "terraform_vnet"
  location            = azurerm_resource_group.terraform.location
  resource_group_name = azurerm_resource_group.terraform.name
  address_space       = var.address_space 

  subnet {
    name           = "subnet1"
    address_prefix = var.address_prefix
    security_group = var.azur-network-security
  }

  subnet {
    name           = "subnet2"
    address_prefix = var.public_subnet2
    security_group = azurerm_network_security_group.terraform.id
  }
  subnet {
    name           = "subnet3"
    address_prefix = "var.subnet3-address_prefix"
    security_group = azurerm_network_security_group.terraform.id
  }
}

# output "vnet_id" {
#     value = azurerm_virtual_network.terraform.id
# }


# output "subnet"{
#     value = azurerm_virtual_network.terraform.subnet
# }

# output "subnet_id" {
#   value = "${azurerm_virtual_network.terraform.subnet.*.id[1]}"

# }
# output "vnet_name"{
#     value = azurerm_virtual_network.terraform.name
# }
# output resource_group_name {
#   value = azurerm_resource_group.terraform.name
# }

# output resource_group_location {
#    value = azurerm_resource_group.terraform.location
# }
