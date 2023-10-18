# Kubernetes cluster provisioning from Ground-up

is an attempt to **manage & provision** 'N' node Kubernetes cluster on public cloud using only open source
tools.<br/><br/>
The steps involve

1. [Add a private network](#add-a-private-network)

2. [Provision servers with a Linux distribution](#provision-servers-with-a-linux-distribution)

3. [Install Rancher Kubernetes engine](#install-rancher-kubernetes-engine)

# Add a private network

Contabo mandates servers instances to be **reinstalled** once a private network is provisioned between instances.
Hence, setting a private network is essential before servers instances are really provisioned.

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

# Provision servers with a Linux distr0

### _Why Contabo?_

1. [x] Infrastructure-as-a-service provider since 2003
2. [x] Virtual Private Server(VPS), Virtual Dedicated Server(VDS), Storage Virtual Private Server(sVPS) provider
3. [x] You can own a public cloud for the price of 2 Starbucks Cappuccino drinks (£8) a month with no additional cost

```bash
$ # Get all instances
$ cntb get instances
```

#### _Useful Links_

* Contabo API : https://api.contabo.com/#section/Introduction

### _Navigate to servers folder_

All servers with **Rocky Linux 9 distribution image & cloud-init configs** are provisioned using **Terraform** scripts

```bash
$ # Initialize a working directory
$ cd server-1
$ terraform init

# ----------------------------

$ # Specify a file that contains key/value pair for variable values & then plan a strategy. Skip interactive approval of plan before applying
$ terraform plan -auto-approve -var-file=./server_1.tfvars  

$ # Specify a file that contains key/value pair for variable values & then destroy the world. Skip interactive approval of plan before applying
$ terraform destroy -auto-approve -var-file=./server_1.tfvars 

$ # Specify a file that contains key/value pair for variable values & then apply configs. Skip interactive approval of plan before applying
$ terraform apply -auto-approve -var-file=./server_1.tfvars  

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


```

**server_*_main.tfvars** has been deliberately omitted in the `git commit` as per best practices.

#### _Useful Links_

* Rocky Linux 9 Security : https://docs.rockylinux.org/guides/
* cloud-init: https://cloudinit.readthedocs.io/en/latest/reference/modules.html
* **dnf** command : https://dnf.readthedocs.io/en/latest/automatic.html#configuration-file-format

#### _Terraform script do_

1. Enable auto update feature in Rocky Linux 9

```bash
$ # Check if dnf-automatic.timer is running
$ sudo systemctl status dnf-automatic.timer
```

2. Firewalld setup -- TODO

```bash
$ # Check if firewalld.service is running
$ sudo systemctl status firewalld
```

3. Rootkit Hunter setup -- TODO
4. SELinux setup -- TODO

# Install Rancher Kubernetes engine

#### _Useful Links_

* Rancker Kubernetes Engine : https://rke.docs.rancher.com