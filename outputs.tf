output "public_ip_addresses" {
  description = "Map (same keys as var.public_ip_addresses) of every output from each public IP addresses created -- see upstream module docs for the full shape."
  value       = module.public_ip_address
}
