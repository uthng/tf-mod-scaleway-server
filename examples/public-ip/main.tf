# vim: sw=2 et ts=2 sts=2

module "server-test" {
  source = "../../"

  count = 1
  server_name = "test"
  server_image = "f66633f0-4dfe-4f0f-9ce4-f393910db9de"
  server_type = "C2S"
  //server_volumes = [
    //{
      //size_in_gb = 50
      //type = "l_ssd"
    //}
  //]

  public_ip = "false"

  security_group = [
    {
      name = "http",
      description = "Allow HTTP/HTTPS"
    }
  ]

  security_rules = [
    {
      action = "accept",
      direction = "inbound",
      ip_range = "0.0.0.0/0",
      protocol = "TCP" 
      port = 80
    },
    {
      action = "accept",
      direction = "inbound",
      ip_range = "0.0.0.0/0",
      protocol = "TCP" 
      port = 443
    }
  ]
}
