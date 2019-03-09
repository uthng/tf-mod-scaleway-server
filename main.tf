# vim: sw=2 et ts=2 sts=2

provider "scaleway" {}

module "scaleway-security-group" {
  source = "./modules/security-group"

  group = "${var.security_group}"
  rules = "${var.security_rules}"
}

module "scaleway-servers" {
  source = "./modules/server"

  count = "${var.count}"

  offset = "${var.offset}"
  name  = "${var.server_name}"
  image = "${var.server_image}"
  type  = "${var.server_type}"

  public_ip = "${var.public_ip}"

  security_group_id = "${module.scaleway-security-group.id}"
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
