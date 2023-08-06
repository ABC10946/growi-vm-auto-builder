resource "proxmox_lxc" "growi-provision" {
    hostname = "growi"
    target_node = "actinium"
    ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
    password = "terraform"
    start = "true"

    ssh_public_keys = <<-EOT
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFTouq403ZuY062irLXthwaeihhYeO3wAO5fNE2Uvg3G abc@einsteinium
    EOT

    rootfs {
        storage = "vm_strg"
        size = "40G"
    }
    memory = 4096

    network {
        name = "eth0"
        bridge = "vmbr0"
        ip = "192.168.3.20/24"
        gw = "192.168.3.1"
    }
}
