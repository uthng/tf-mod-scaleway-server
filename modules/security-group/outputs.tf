# vim: sw=2 et ts=2 sts=2

output "name" {
  value = "${var.group["name"]}"
}

output "id" {
  value = "${scaleway_security_group.group.0.id}"
}

output "rules" {
    value = "${var.rules}"
}

output "rule_ids" {
    value = ["${scaleway_security_group_rule.rule.*.id}"]
}
