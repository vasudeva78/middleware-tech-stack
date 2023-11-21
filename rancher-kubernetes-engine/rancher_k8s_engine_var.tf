variable "server_2_name" {
  type        = string
  description = "Display name to be shown on https://my.contabo.com/abos"
}

variable "server_2_public_ip" {
  type      = string
  sensitive = true
}

variable "server_2_internal_ip" {
  type      = string
  sensitive = true
}

variable "ssh_2_private_key" {
  type        = string
  description = "Location of SSH private key."
}

variable "server_2_docker_user" {
  type        = string
  description = "Non-root user for docker"
}

variable "server_3_name" {
  type        = string
  description = "Display name to be shown on https://my.contabo.com/abos"
}

variable "server_3_public_ip" {
  type      = string
  sensitive = true
}

variable "server_3_internal_ip" {
  type      = string
  sensitive = true
}

variable "ssh_3_private_key" {
  type        = string
  description = "Location of SSH private key."
}

variable "server_3_docker_user" {
  type        = string
  description = "Non-root user for docker"
}

variable packages {
  type    = list
  default = []
}
