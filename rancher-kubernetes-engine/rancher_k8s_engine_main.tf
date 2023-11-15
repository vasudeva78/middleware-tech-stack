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

resource rke_cluster "my-first-cluster" {
  cluster_name = "my-first-k8s-cluster"
  cluster_yaml = file("./cluster.yml")

  # If set to true, RKE will not fail when unsupported Docker version are found
  ignore_docker_version = true

  # Keep using Docker as the default container runtime
  enable_cri_dockerd = true
}

###############################################################################
# If you need kubeconfig.yml for using kubectl, please uncomment follows.
###############################################################################
resource "local_file" "kube_cluster_yaml" {
  filename = "./kube_config_cluster.yml"
  content  = rke_cluster.my-first-cluster.kube_config_yaml
}