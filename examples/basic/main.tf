terraform {
  required_version = ">= 1.7.0"
}

module "network-publicip" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  public_ip_addresses = {} # see README Inputs table / upstream module docs for the per-entry schema
}
