# growi-vm-auto-builder

build growi virtual machine for proxmox automatically with terraform and ansible

# require to change

- terraform/secret.tf `pve_user` `pve_password`
- terraform/provider.tf `pm_api_url`
- terraform/userdata/adduser.yaml `ssh_authorized_keys`
- ansible/inventory.yaml `growi.hosts`

# how to use

```
$ cd terraform
$ terraform apply
$ cd ../ansible
$ ansible-playbook -i inventory site.yaml
```
