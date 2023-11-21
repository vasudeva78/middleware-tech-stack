terraform {
  required_providers {
    rke = {
      source  = "rancher/rke"
      version = "1.4.2"

    }
  }
}

provider "rke" {
  debug    = true
  log_file = "./rke_debug.log"
}

resource "rke_cluster" "my-k8s-cluster" {
  cluster_name = "my-first-k8s-cluster"

  # If set to true, RKE will not fail when unsupported Docker version are found
  ignore_docker_version = true

  # Keep using Docker as the default container runtime
  enable_cri_dockerd = true

  nodes {
    address          = var.server_2_public_ip
    internal_address = var.server_2_internal_ip
    node_name        = var.server_2_name
    role             = ["controlplane", "worker", "etcd"]
    user             = var.server_2_docker_user
    ssh_key          = file(var.ssh_2_private_key)
  }

  nodes {
    address          = var.server_3_public_ip
    internal_address = var.server_3_internal_ip
    node_name        = var.server_3_name
    role             = ["controlplane", "worker", "etcd"]
    user             = var.server_3_docker_user
    ssh_key          = file(var.ssh_3_private_key)
  }

}

###############################################################################
# If you need kubeconfig.yml for using kubectl, please uncomment follows.
###############################################################################
resource "local_file" "kube_cluster_yaml" {
  filename = "./kube_config_cluster.yml"
  content  = rke_cluster.my-k8s-cluster.kube_config_yaml
}