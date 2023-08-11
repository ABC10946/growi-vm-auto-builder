resource "local_file" "cloud_init_user_data_file" {
	content = file("${path.module}/userdata/adduser.yaml")
	filename = "${path.module}/userdata/adduser.yaml"
}

resource "null_resource" "cloud_init_config" {
	connection {
		type = "ssh"
		user = var.pve_user
		password = var.pve_password
		host = "192.168.3.80"
	}

	provisioner "file" {
	    source = local_file.cloud_init_user_data_file.filename
	    destination = "/var/lib/vz/snippets/adduser.yaml"
	}
}

resource "proxmox_vm_qemu" "growi-provision" {
	depends_on = [
		null_resource.cloud_init_config
	]

	name = "growi"
	target_node = "actinium"
	clone = "ubuntu-template"
	onboot = true

	cicustom = "user=local:snippets/adduser.yaml"

	disk {
		type = "sata"
		storage = "vm_strg"
		size = "40G"
	}
	memory = 4096

	ipconfig0 = "ip=192.168.3.20/24,gw=192.168.3.1"
}
