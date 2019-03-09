
variable "group" {
  description = "Scaleway security group"
  type = "map"
  default = {
    name = "http"
    description = "Allow HTTP/HTTPS"
  }
}

variable "rules" {
  description = "List of security rules attached to security group"
  type = "list"
  default = [
    {
      action = "accept",
      direction = "inbound",
      ip_range = "0.0.0.0/0",
      protocol = "TCP" 
      port = 80
    }
  ]
}
