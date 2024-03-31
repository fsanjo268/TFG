resource "proxmox_lxc" "demo_lab" {

  hostname = "test-vm-${count.index + 1}"
  count = 1
  target_node = var.pm_node_name
  vmid = 100 + count.index

  ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  cores = 1
  memory = 512
  start = true

  unprivileged = false
  password = var.lxc-password
  ssh_public_keys = var.ssh_key

  rootfs {
    storage = "local"
    size = "2G"
  }

  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "192.168.1.${count.index+100}/24"
  }
}