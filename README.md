# terraform-azure-network-publicip

Org-standard Terraform wrapper for: **public IP addresses**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/engryinker/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/engryinker/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "network-publicip" {
  source = "git::https://github.com/engryinker/terraform-azure-network-publicip.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  public_ip_addresses = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `public_ip_addresses` (public IP addresses)

Wraps [Azure/avm-res-network-publicipaddress/azurerm](https://registry.terraform.io/modules/Azure/avm-res-network-publicipaddress/azurerm/0.2.1) v0.2.1.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `ddos_protection_mode` | `string` | no |  |
| `ddos_protection_plan_id` | `string` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `idle_timeout_in_minutes` | `number` | no |  |
| `role_assignments` | `any` | no |  |
| `sku_tier` | `string` | no |  |
| `allocation_method` | `string` | no |  |
| `ip_tags` | `map(string)` | no |  |
| `public_ip_prefix_id` | `string` | no |  |
| `domain_name_label` | `string` | no |  |
| `ip_version` | `string` | no |  |
| `lock` | `any` | no |  |
| `reverse_fqdn` | `string` | no |  |
| `edge_zone` | `string` | no |  |
| `sku` | `string` | no |  |
| `zones` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `public_ip_addresses` -- map (same keys as the input) of every output from each created public IP addresses.
