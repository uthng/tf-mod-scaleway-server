# vim: sw=2 et ts=2 sts=2

output "name" {
  value = "${var.group["name"]}"
}

// Hack: depending on count value, scaleway_security_group.group or
// data.scaleway_security_group.group is defined or not.
// While using with join, if they are undefined, it will be considered
// as an empty list. If not, Terraform doesnt like and raise an error.
output "id" {
  value = "${length(var.rules) <= 0 ? join("", data.scaleway_security_group.group.*.id) : join("", scaleway_security_group.group.*.id)}"
}

output "rules" {
    value = "${var.rules}"
}

output "rule_ids" {
    value = ["${scaleway_security_group_rule.rule.*.id}"]
}
