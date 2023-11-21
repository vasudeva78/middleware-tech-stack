terraform {
  required_providers {
    contabo = {
      source  = "contabo/contabo"
      version = ">= 0.1.22"
    }
  }
}

# Configure your Contabo API credentials in provider stanza
provider "contabo" {
  oauth2_client_id     = var.oauth2_client_id
  oauth2_client_secret = var.oauth2_client_secret
  oauth2_user          = var.oauth2_user
  oauth2_pass          = var.oauth2_pass
}

# Create a new private network
resource "contabo_private_network" "k8sPrivateNetwork" {
  name         = "k8sPrivateNetwork"
  description  = "Private network for kubernetes"
  region       = var.contabo_region
  instance_ids = [var.server_2_instance_id, var.server_3_instance_id]
}