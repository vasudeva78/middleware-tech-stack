# Manage Servers Using Terraform 🌐

Terraform scripts to manage servers on Contabo

Why Contabo?

1. [x] Infrastructure-as-a-service provider since 2003
2. [x] Virtual Private Server(VPS), Virtual Dedicated Server(VDS), Storage Virtual Private Server(sVPS) provider
3. [x] You can own a public cloud for the price of 2 Starbucks Cappuccino drinks (£8) a month with no additional cost
4. [x] Not affiliated to the provider, in any manner

## Folder _servers_

All servers with appropriate Linux
images & [cloud-init](https://cloudinit.readthedocs.io/en/latest/reference/modules.html) configs are provisioned here

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

**server_1_main.tfvars** has been deliberately omitted in the `git commit` as per best pratices.

### Server Operating System

* Rocky Linux 9 : https://docs.rockylinux.org/guides/
* **dnf** command wiki : https://dnf.readthedocs.io/en/latest/automatic.html#configuration-file-format

### What the Terraform script do ?

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