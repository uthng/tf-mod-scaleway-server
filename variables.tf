# vim: sw=2 et ts=2 sts=2

variable "server_name" {
  description = "Server name. If count > 1, it will be suffixed by the counter"
}

variable "server_image" {
  description = "Scaleway image UUID to use to deploy server"
}

variable "server_type" {
  description = "Scaleway server type"
}

variable "server_count" {
  description = "Number of servers of the same type to be created"
  default = 1
}

variable "offset" {
  description = "Offset for counter to know from which number we use in the server name"
  default = 0
}

variable "public_ip" {
  description = "Public IP or not"
  default = "true"
}
