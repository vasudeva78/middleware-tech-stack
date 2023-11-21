# Kubernetes cluster provisioning from Ground-up

is an attempt to **manage & provision** 'N' node Kubernetes cluster on public cloud using only open source
tools.<br/><br/>
The steps involve

1. [Add a private network](#add-a-private-network)

2. [Provision nodes](#provision-nodes)

3. [Install Rancher Kubernetes engine](#install-rancher-kubernetes-engine)

# Add a private network

Contabo mandates servers instances to be **reinstalled** once a private network is provisioned between nodes.
Hence, setting a private network is essential before node instances are actually provisioned.

```bash
$ # Initialize a working directory
$ cd private-network
$ terraform init

# ----------------------------

$ # Specify a file that contains key/value pair for variable values & then plan a strategy. Skip interactive approval of plan before applying
$ terraform plan -auto-approve -var-file=./private_network.tfvars  

$ # Specify a file that contains key/value pair for variable values & then destroy the world. Skip interactive approval of plan before applying
$ terraform destroy -auto-approve -var-file=./private_network.tfvars 

$ # Specify a file that contains key/value pair for variable values & then apply configs. Skip interactive approval of plan before applying
$ terraform apply -auto-approve -var-file=./private_network.tfvars   


```

# Provision nodes

### _Why Contabo?_

1. [x] Infrastructure-as-a-service provider since 2003
2. [x] Virtual Private Server(VPS), Virtual Dedicated Server(VDS), Storage Virtual Private Server(sVPS) provider
3. [x] You can own a public cloud for £8 a month with no additional cost

```bash
$ # Get all instances
$ cntb get instances

$ # Get all private networks
$ cntb get privateNetworks
```

#### _Useful Links_

* Contabo API : https://api.contabo.com/#section/Introduction

### _Navigate to servers folder_

All servers with **Rocky Linux 9 distribution image & cloud-init configs** are provisioned using **Terraform** scripts

```bash
$ # Initialize a working directory
$ cd server-2
$ terraform init

# ----------------------------

$ # Specify a file that contains key/value pair for variable values & then plan a strategy. Skip interactive approval of plan before applying
$ terraform plan -auto-approve -var-file=./server_2.tfvars  

$ # Specify a file that contains key/value pair for variable values & then destroy the world. Skip interactive approval of plan before applying
$ terraform destroy -auto-approve -var-file=./server_2.tfvars 

$ # Specify a file that contains key/value pair for variable values & then apply configs. Skip interactive approval of plan before applying
$ terraform apply -auto-approve -var-file=./server_2.tfvars  

$ # Initialize a working directory
$ cd server-3
$ terraform init

# ----------------------------

$ # Specify a file that contains key/value pair for variable values & then plan a strategy. Skip interactive approval of plan before applying
$ terraform plan -auto-approve -var-file=./server_3.tfvars 

$ # Specify a file that contains key/value pair for variable values & then destroy the world. Skip interactive approval of plan before applying
$ terraform destroy -auto-approve -var-file=./server_3.tfvars 

$ # Specify a file that contains key/value pair for variable values & then apply configs. Skip interactive approval of plan before applying
$ terraform apply -auto-approve -var-file=./server_3.tfvars 


```

**server_*_main.tfvars** has been deliberately omitted in the `git commit` as per best practices.

#### _Useful Links_

* Rocky Linux 9 Security : https://docs.rockylinux.org/guides/
* firewalld : https://firewalld.org/documentation/
* firewalld xml : https://firewalld.org/documentation/man-pages/firewalld.zone.html
* cloud-init: https://cloudinit.readthedocs.io/en/latest/reference/modules.html
* **dnf** command : https://dnf.readthedocs.io/en/latest/automatic.html#configuration-file-format

#### _What do the Terraform scripts do_

1. Enable auto update feature in Rocky Linux 9

```bash
$ # Check if dnf-automatic.timer is running
$ sudo systemctl status dnf-automatic.timer
```

2. Firewalld setup

1. Uses **zones** to segment traffic
2. _Network interface(s)_ are assigned to one or more **zones**
3. Each **zone** contains a list of allowed ports and services.
4. A default **zone** is also available to manage traffic.

```bash

$ # View all network interfaces
$ nmcli 

$ # Get all listening ports
$ sudo ss -tulpn

$ # Check if firewalld.service is running
$ sudo systemctl status firewalld

$ # Get all active zones 
$ sudo firewall-cmd --get-active-zones

$ # Get all rules tied to the zone’s configuration 
$ sudo firewall-cmd --zone=public --list-all

$ # Open port in a zone 
$ sudo firewall-cmd --zone=public --add-port=2379/tcp

$ # Save changes permanently 
$ sudo firewall-cmd --runtime-to-permanent

$ # After every permanent change, reload firewall
$ sudo firewall-cmd --reload

$ # List all open ports
$ sudo firewall-cmd --zone=public --list-ports

```

3. Rootkit Hunter setup -- TODO
4. SELinux setup -- TODO
5. Create a docker user

# Install Rancher Kubernetes engine

```bash
$ # Initialize a working directory
$ cd rancher-kubernetes-engine
$ terraform init

# ----------------------------

$ # Apply configs. Skip interactive approval of plan before applying
$ terraform apply -auto-approve -var-file=./rancher_k8s_engine.tfvars

# ----------------------------

$ # Verify kubernetes nodes after RKE installation
$ kubectl --kubeconfig kube_config_cluster.yml get nodes

```

#### _Useful Links_

* Rancker Kubernetes Engine : https://rke.docs.rancher.com
* cluster.yml :
    * Full cluster.yml : https://rke.docs.rancher.com/example-yamls#full-clusteryml-example
    * cluster.yml documentation: https://rancher.support/training/rke/rke-cluster-yaml-breakdown
* Terraform provider for RKE
    * https://github.com/rancher/terraform-provider-rke
    * https://registry.terraform.io/providers/rancher/rke/latest/docs/resources/cluster
