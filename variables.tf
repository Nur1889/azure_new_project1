variable "location" {
  type        = string
}
variable "address_space " {
  type        = string
}

variable "storage_account_name" {
  type        = string
}
variable "address_prefix" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "public_subnet3" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}

variable "private_subnet1" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "public_subnet2" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "private_subnet3" {
  description = "Please provide subnet CIDR block"
  type        = string
  default     = ""
}
variable "azur-network-security" {
  description = "Please provide subnet security group id"
  
}
variable "access_key"
  descryption = "please provide access_key"