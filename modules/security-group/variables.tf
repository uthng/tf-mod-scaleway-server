
variable "group" {
  description = "Scaleway security group"
  type = "map"
  default = {}
}

variable "rules" {
  description = "List of security rules attached to security group"
  type = "list"
  default = []
}
