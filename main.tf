# vim: sw=2 et ts=2 sts=2

provider "scaleway" {}

resource "scaleway_server" "server" {
  count = "${var.count}"
  name  = "${var.server_name}${var.count > 1 ? format("%d", count.index + var.offset) : ""}"
  image = "${var.server_image}"
  type  = "${var.server_type}"

  # Hack on empty list. Wait for 0.12 release to fix it
  public_ip = "${var.public_ip == "true" ? element(concat(scaleway_ip.public_ip.*.ip, list("")), count.index) : ""}"

  security_group = "${scaleway_security_group.group.id}"
}

resource "scaleway_ip" "public_ip" {
  count = "${var.public_ip == "true" ? var.count : 0}"
  //server = "${element(scaleway_server.server.*.id, count.index)}"
}

//resource "scaleway_volume" "volume" {
  //name       = "test"
  //size_in_gb = 50
  //type       = "l_ssd"
//}

//resource "scaleway_volume_attachment" "test" {
  //server = "${scaleway_server.test.id}"
  //volume = "${scaleway_volume.test.id}"
//}

resource "scaleway_security_group" "group" {
  count = "${length(var.security_group) == 0 ? 0 : 1}"

  name        = "${lookup(var.security_group, "name")}"
  description = "${lookup(var.security_group, "description")}"
}

resource "scaleway_security_group_rule" "rule" {
  count = "${length(var.security_rules)}"

  security_group = "${scaleway_security_group.group.id}"

  action    = "${lookup(var.security_rules[count.index], "action")}"
  direction = "${lookup(var.security_rules[count.index], "direction")}"
  ip_range  = "${lookup(var.security_rules[count.index], "ip_range")}"
  protocol  = "${lookup(var.security_rules[count.index], "protocol")}"
  port      = "${lookup(var.security_rules[count.index], "port")}"
}
