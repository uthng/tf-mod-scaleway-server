# vim: sw=2 et ts=2 sts=2

module "public-ip" {
  source = "../../"

  server_name = "test"
  server_image = "f66633f0-4dfe-4f0f-9ce4-f393910db9de"
  server_type = "START1-S"
  server_count = 1

  public_ip = "false"
}
