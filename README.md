# middleware-tecl-stack

is an attempt to **manage & provision** 'N' node Kubernetes cluster on public cloud using open source tools.<br/>
The steps involve

1. [Provision servers with a Linux distribution](#provision-servers-with-a-linux-distribution)

2. [Install Rancher Kubernetes engine](#install-rancher-kubernetes-engine)

# Provision servers with a Linux distribution

We used _**Terraform scripts**_ to manage servers on _Contabo_

#### _Why Contabo?_

1. [x] Infrastructure-as-a-service provider since 2003
2. [x] Virtual Private Server(VPS), Virtual Dedicated Server(VDS), Storage Virtual Private Server(sVPS) provider
3. [x] You can own a public cloud for the price of 2 Starbucks Cappuccino drinks (£8) a month with no additional cost

#### _Navigate to servers folder_

All servers with **Rocky Linux 9 distribution image & cloud-init configs** are provisioned here

```bash
$ # Initialize a working directory
$ cd server-1
$ terraform init

# ----------------------------

$ # Specify a file that contains key/value pair for variable values & then plan a strategy. Skip interactive approval of plan before applying
$ terraform plan -auto-approve -var-file=./server_1_main.tfvars 

$ # Specify a file that contains key/value pair for variable values & then destroy the world. Skip interactive approval of plan before applying
$ terraform destroy -auto-approve -var-file=./server_1_main.tfvars 

$ # Specify a file that contains key/value pair for variable values & then apply configs. Skip interactive approval of plan before applying
$ terraform apply -auto-approve -var-file=./server_1_main.tfvars 

$ # Initialize a working directory
$ cd server-2
$ terraform init

# ----------------------------

$ # Specify a file that contains key/value pair for variable values & then plan a strategy. Skip interactive approval of plan before applying
$ terraform plan -auto-approve -var-file=./server_2_main.tfvars 

$ # Specify a file that contains key/value pair for variable values & then destroy the world. Skip interactive approval of plan before applying
$ terraform destroy -auto-approve -var-file=./server_2_main.tfvars 

$ # Specify a file that contains key/value pair for variable values & then apply configs. Skip interactive approval of plan before applying
$ terraform apply -auto-approve -var-file=./server_2_main.tfvars 


```

**server_*_main.tfvars** has been deliberately omitted in the `git commit` as per best practices.

#### _Useful Links_

* Rocky Linux 9 Security : https://docs.rockylinux.org/guides/
* cloud-init: https://cloudinit.readthedocs.io/en/latest/reference/modules.html
* **dnf** command : https://dnf.readthedocs.io/en/latest/automatic.html#configuration-file-format

#### _Terraform script_

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

ddd