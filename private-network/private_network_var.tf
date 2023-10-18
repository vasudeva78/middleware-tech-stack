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

variable "contabo_region" {
  type        = string
  description = "https://api.contabo.com/#tag/Instances/operation/createInstance"
}

variable "server_1_instance_id" {
  type        = string
  description = "GET instance id from ```cntb get instances```"
}

variable "server_2_instance_id" {
  type        = string
  description = "The instance id of my other server(s)"
}
