# ---------------------------------------------------------------------------------------------------------------------
# Contabo login credentials from Control panel >> API
# ---------------------------------------------------------------------------------------------------------------------

variable "oauth2_client_id" {
  type      = string
  sensitive = true
}

variable "oauth2_client_secret" {
  type      = string
  sensitive = true
}

variable "oauth2_user" {
  type      = string
  sensitive = true
}

variable "oauth2_pass" {
  type      = string
  sensitive = true
}

# ---------------------------------------------------------------------------------------------------------------------
# Contabo instance details
# ---------------------------------------------------------------------------------------------------------------------
variable "server_public_ip" {
  type      = string
  sensitive = true
}

variable "server_display_name" {
  type        = string
  description = "Display name to be shown on https://my.contabo.com/abos"
}

variable "server_contabo_region" {
  type        = string
  description = "https://api.contabo.com/#tag/Instances/operation/createInstance"
}

variable "server_existing_instance_id" {
  type        = string
  description = "GET instance id from ```cntb get instances```"
}

# ---------------------------------------------------------------------------------------------------------------------
# CLOUD INIT VARIABLES
# Variables used for generation of metadata and userdata.
# ---------------------------------------------------------------------------------------------------------------------

variable "server_root_user" {
  type        = string
  description = "Root user in the remote machine"
}

variable "server_docker_user" {
  type        = string
  description = "Non-root user for docker"
}

variable "server_ssh_public_key" {
  type        = string
  description = "Location of SSH public key."
}

variable packages {
  type    = list
  default = []
}