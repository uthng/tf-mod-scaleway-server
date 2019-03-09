Terraform module for Scaleway Server
====================
A Terraform module for creating any Scaleway server. It also handles IP public, security group, security rules and volumes directly in server.

#### Usage
```
module "server-test" {
  source = "../../"

  count = 1
  server_name = "test"
  server_image = "f66633f0-4dfe-4f0f-9ce4-f393910db9de"
  server_type = "C2S"
  server_volumes = [
    {
      size_in_gb = 50
      type = "l_ssd"
    }
  ]

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
```

#### Submodules
This module has 2 submodules:
- `server`: handles `scaleway_server` resource and additional volumes using `volume` attribute.
- `security-group`: handles `scaleway_group` and `scaleway_group_rule`.

#### Input Variables
- `server_name` (required): Server name. If count > 1, it will be suffixed by the counter. Ex: serv1, serv2 etc.
- `server_image` (required): Scaleway image UUID to use to deploy server
- `server_type` (requried): Scaleway server type
- `server_volumes` (optional): Additional volumes sharing lifetime of servers. Type: `list`. Default: `[]`
- `count` (optional): Number of servers of the same type to be created. Default: `1`
- `offset` (optional): Offset for counter to know from which number we use in the server name. Default: `1`
- `public_ip`: Public IP or not. Default: `true`
- `security_group`: Scaleway security group. Type: `map`. Default: `{name = "http", description = "Allow HTTP/HTTPS"}`
- `security_rules`: List of security rules attached to security group. Type: `list`. Default: `[{action = "accept", direction = "inbound", ip_range = "0.0.0.0/0",  protocol = "TCP", port = 80}]`