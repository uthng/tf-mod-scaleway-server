output "server_ids" {
  value = ["${module.scaleway-servers.server_ids}"]
}

output "server_attributes" {
  value = ["${module.scaleway-servers.server_attributes}"]
}

output "security_group" {
  value = ["${module.scaleway-security-group.id}"]
}
