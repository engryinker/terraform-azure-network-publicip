data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "public_ip_address" {
  source   = "Azure/avm-res-network-publicipaddress/azurerm"
  version  = "0.2.1"
  for_each = var.public_ip_addresses

  name                    = each.value.name
  location                = var.location
  resource_group_name     = var.resource_group_name
  tags                    = coalesce(each.value.tags, var.tags)
  enable_telemetry        = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  ddos_protection_mode    = each.value.ddos_protection_mode
  ddos_protection_plan_id = each.value.ddos_protection_plan_id
  diagnostic_settings     = each.value.diagnostic_settings
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  role_assignments        = each.value.role_assignments
  sku_tier                = each.value.sku_tier
  allocation_method       = each.value.allocation_method
  ip_tags                 = each.value.ip_tags
  public_ip_prefix_id     = each.value.public_ip_prefix_id
  domain_name_label       = each.value.domain_name_label
  ip_version              = each.value.ip_version
  lock                    = each.value.lock
  reverse_fqdn            = each.value.reverse_fqdn
  edge_zone               = each.value.edge_zone
  sku                     = each.value.sku
  zones                   = each.value.zones
}
