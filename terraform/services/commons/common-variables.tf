variable "volumes_base_image" {
  type        = string
  description = "The base image used to create volumes."
}

variable "srv_name_prefix" {
  type        = string
  description = "The srv name prefix"
}

variable "srv_nodes_count" {
  type        = number
  description = "The number of srv nodes."
}

variable "macvtap_interface" {
  type        = string
  description = "The interface name to use with macvtap"
}
