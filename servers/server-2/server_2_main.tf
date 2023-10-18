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

data "template_file" "user_data" {
  template = file("../server_cloud_config.yml")

  vars = {
    root_user      = var.server_root_user
    docker_user    = var.server_docker_user
    ssh_public_key = file(var.server_ssh_public_key)
    packages       = jsonencode(var.packages)
  }
}

# Create a new compute instance (vps/vds) in region UK, with specs of the V40 product. Also it has a contract period of 1 month
resource "contabo_instance" "server_2" {
  display_name = var.server_display_name

  # https://api.contabo.com/#tag/Instances/operation/createInstance
  product_id           = "V40"
  region               = var.server_contabo_region
  period               = 1
  existing_instance_id = var.server_existing_instance_id

  # Rockylinux 9.0 image
  image_id = "fe6c2c36-031e-4474-aa5c-c5297196c80e"

  # Ubuntu 22.04 image
  #  image_id = "afecbb85-e2fc-46f0-9684-b46b1faf00bb"

  user_data = data.template_file.user_data.rendered

}
