terraform {
  required_providers {
    rke = {
      source  = "rancher/rke"
      version = "1.4.2"
    }
  }
}

resource rke_cluster "cluster" {
  nodes {
    address          = "192.2.0.1"
    internal_address = "192.2.0.1"
    user             = "rancher"
    role             = ["controlplane", "worker", "etcd"]
    ssh_key          = file("~/.ssh/id_rsa")
  }
  nodes {
    address          = "192.2.0.2"
    internal_address = "192.2.0.2"
    user             = "rancher"
    role             = ["controlplane", "worker", "etcd"]
    ssh_key          = file("~/.ssh/id_rsa")
  }
}

###############################################################################
# If you need kubeconfig.yml for using kubectl, please uncomment follows.
###############################################################################
resource "local_file" "kube_cluster_yaml" {
  filename = "${path.root}/kube_config_cluster.yml"
  content  = rke_cluster.cluster.kube_config_yaml
}