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

variable "server_1_login_password" {
  type      = string
  sensitive = true
}

# ---------------------------------------------------------------------------------------------------------------------
# Contabo instance details
# ---------------------------------------------------------------------------------------------------------------------
variable "server_1_public_ip" {
  type      = string
  sensitive = true
}

variable "server_1_contabo_region" {
  type        = string
  description = "https://api.contabo.com/#tag/Instances/operation/createInstance"
}

variable "server_1_existing_instance_id" {
  type        = string
  description = "GET instance id from ```cntb get instances```"
}

# ---------------------------------------------------------------------------------------------------------------------
# CLOUD INIT VARIABLES
# Variables used for generation of metadata and userdata.
# ---------------------------------------------------------------------------------------------------------------------

variable "server_1_root_user" {
  type        = string
  description = "Root user in the remote machine"
}

variable "server_1_ssh_public_key" {
  type        = string
  description = "Location of SSH public key."
}

variable packages {
  type    = list
  default = []
}