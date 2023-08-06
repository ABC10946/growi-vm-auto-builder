terraform {
	required_providers {
		proxmox = {
			source = "telmate/proxmox"
			version = "2.9.14"
		}
	}
}

provider "proxmox" {
	pm_user = "terraform-prov@pve"
	pm_password = "terraform"
	pm_api_url = "https://actinium.element:8006/api2/json"
}
