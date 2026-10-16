variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "public_ip_addresses" {
  description = "Map of public IP addresses to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-network-publicipaddress/azurerm v0.2.1 (https://registry.terraform.io/modules/Azure/avm-res-network-publicipaddress/azurerm/0.2.1) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                    = string
    tags                    = optional(map(string))
    enable_telemetry        = optional(bool)
    ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
    ddos_protection_plan_id = optional(string, null)
    diagnostic_settings     = optional(any, null)
    idle_timeout_in_minutes = optional(number, 4)
    role_assignments        = optional(any, null)
    sku_tier                = optional(string, "Regional")
    allocation_method       = optional(string, "Static")
    ip_tags                 = optional(map(string), {})
    public_ip_prefix_id     = optional(string, null)
    domain_name_label       = optional(string, null)
    ip_version              = optional(string, "IPv4")
    lock                    = optional(any, null)
    reverse_fqdn            = optional(string, null)
    edge_zone               = optional(string, null)
    sku                     = optional(string, "Standard")
    zones                   = optional(any, [1, 2, 3])
  }))
  default = {}
}
