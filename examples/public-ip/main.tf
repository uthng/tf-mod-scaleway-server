# vim: sw=2 et ts=2 sts=2

module "server-test" {
  source = "../../"

  count = 1
  server_name = "test1"
  server_image = "63541ee1-8528-48f7-9cdf-c3f7f681c630"
  server_type = "C2S"
  //server_volumes = [
    //{
      //size_in_gb = 50
      //type = "l_ssd"
    //}
  //]

  public_ip = "false"

  security_group = {
    name = "test",
    description = "Allow HTTP/HTTPS"
  }

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

module "server-test-security-group" {
  source = "../../"

  count = 1
  server_name = "test2"
  server_image = "63541ee1-8528-48f7-9cdf-c3f7f681c630"
  server_type = "C2S"
  //server_volumes = [
    //{
      //size_in_gb = 50
      //type = "l_ssd"
    //}
  //]

  public_ip = "false"

  security_group = {
    name = "http"
  }

}
