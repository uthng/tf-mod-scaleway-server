# vim: sw=2 et ts=2 sts=2

provider "scaleway" {}

resource "scaleway_server" "server" {
  count = "${var.count}"
  name  = "${var.name}${var.count > 1 ? format("%d", count.index + var.offset) : ""}"
  image = "${var.image}"
  type  = "${var.type}"

  # Hack on empty list. Wait for 0.12 release to fix it
  public_ip = "${var.public_ip == "true" ? element(concat(scaleway_ip.public_ip.*.ip, list("")), count.index) : ""}"

  security_group = "${var.security_group_id}"
}

resource "scaleway_ip" "public_ip" {
  count = "${var.public_ip == "true" ? var.count : 0}"
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
