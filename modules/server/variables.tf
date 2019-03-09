# vim: sw=2 et ts=2 sts=2

variable "name" {
  description = "Server name. If count > 1, it will be suffixed by the counter"
}

variable "image" {
  description = "Scaleway image UUID to use to deploy server"
}

variable "type" {
  description = "Scaleway server type"
}

variable "count" {
  description = "Number of servers of the same type to be created"
  default = 1
}

variable "offset" {
  description = "Offset for counter to know from which number we use in the server name"
  default = 1
}

variable "public_ip" {
  description = "Public IP or not"
  default = "true"
}

variable "security_group_id" {
  description = "Security group ID"
  default = ""
}
