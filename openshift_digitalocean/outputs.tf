output "master_domain" {
  value = "${format("%s.%s.shapeblock.cloud", var.console_subdomain, var.domain)}"
}

output "node_domains" {
  value = "${formatlist("%s.%s.shapeblock.cloud", digitalocean_droplet.nodes.*.name, var.domain)}"
}

output "master_ip_address" {
  value = "${digitalocean_droplet.master.ipv4_address}"
}

output "master_id" {
  value = "${digitalocean_droplet.master.id}"
}

output "node_ip_address" {
  value = "${digitalocean_droplet.nodes.*.ipv4_address}"
}

output "node_ids" {
  value = "${digitalocean_droplet.nodes.*.id}"
}

output "apps_subdomain" {
  value = "${format("%s.%s.shapeblock.cloud", var.apps_subdomain, var.domain)}"
}
