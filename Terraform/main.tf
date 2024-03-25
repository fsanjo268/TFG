resource "proxmox_vm_qemu" "demo_lab" {

  name = "test_vm${count.index + 1}"
  count = 1
  target_node = var.pm_node_name
  vmid = 100 + count.index

  ostemplate = "local:vztmpl/ubuntu-22.04-standar_22.004-1_amd64.tar.zst"
  cores = 1
  memory = 512

  unprivileged = false
  ssh_public_keys = var.ssh_key

  rootfs {
    storage = "local"
    size = "2G"
  }

  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "192.168.1.${count.index+100}/24"
    gt = "192.168.1.1"
  }
}