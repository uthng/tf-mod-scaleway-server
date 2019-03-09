# vim: ts=2 et sts=2 sw=2

output "server_ids" {
  value = "${scaleway_server.server.*.id}"
}

output "server_attributes" {
  value = "${ map(
    "image", "${scaleway_server.server.0.image}",
    "type", "${scaleway_server.server.0.type}",
    "security_group", "${scaleway_server.server.0.security_group}"
    )
  }"
}
