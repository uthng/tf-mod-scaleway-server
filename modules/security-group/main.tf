provider "scaleway" {}

data "scaleway_security_group" "group" {
  count = "${length(var.rules) == 0 && lookup(var.group, "name", "") != "" ? 1 : 0}"
  name = "${lookup(var.group, "name")}"
}

resource "scaleway_security_group" "group" {
  count = "${length(var.rules) > 0 && lookup(var.group, "name", "") != "" ? 1 : 0}"

  name        = "${lookup(var.group, "name")}"
  description = "${lookup(var.group, "description", "")}"
}

resource "scaleway_security_group_rule" "rule" {
  count = "${length(var.rules) > 0 && lookup(var.group, "name", "") != "" ? length(var.rules) : 0}"

  security_group = "${scaleway_security_group.group.id}"

  action    = "${lookup(var.rules[count.index], "action")}"
  direction = "${lookup(var.rules[count.index], "direction")}"
  ip_range  = "${lookup(var.rules[count.index], "ip_range")}"
  protocol  = "${lookup(var.rules[count.index], "protocol")}"
  port      = "${lookup(var.rules[count.index], "port")}"
}
