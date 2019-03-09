# vim: sw=2 et ts=2 sts=2

provider "scaleway" {}

resource "scaleway_server" "server" {
  count = "${var.server_count}"
  name  = "${var.server_name}${var.server_count > 1 ? format("%s", count.index + var.offset) : ""}"
  image = "${var.server_image}"
  type  = "${var.server_type}"

  # Hack on empty list. Wait for 0.12 release to fix it
  public_ip = "${var.public_ip == "true" ? element(concat(scaleway_ip.public_ip.*.ip, list("")), count.index) : ""}"
}

resource "scaleway_ip" "public_ip" {
  count = "${var.public_ip == "true" ? var.server_count : 0}"
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

resource "scaleway_security_group" "http" {
  name        = "http"
  description = "allow HTTP and HTTPS traffic"
}

resource "scaleway_security_group_rule" "http_accept" {
  security_group = "${scaleway_security_group.http.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 80
}

resource "scaleway_security_group_rule" "https_accept" {
  security_group = "${scaleway_security_group.http.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 443
}
