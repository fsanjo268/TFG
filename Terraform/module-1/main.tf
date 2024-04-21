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
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKskyaMLTz3C97I8k1gGQLWu/oxrNfBESq241A68GCbN ansible@tfg2010
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAlGhVOjcg+fhOQnF5UXgTfCJr2lTSRdmJO5zeDxcEbR root@tfg2010
  EOT

  rootfs {
    storage = "local"
    size = "2G"
  }

  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "192.168.1.${count.index+100}/24"
    gw = "192.168.1.1"
  }
  network {
    name = "eth1"
    bridge = "vmbr0"
    ip = "192.168.2.${count.index+100}/24"
    gw = "192.168.1.1"
  }
  
}

resource "proxmox_lxc" "demo_lab" {

  hostname = "test-vm-${count.index + 2}"
  count = 1
  target_node = var.pm_node_name
  vmid = 101 + count.index

  ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  cores = 1
  memory = 512
  start = true

  unprivileged = false
  password = var.lxc-password
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKskyaMLTz3C97I8k1gGQLWu/oxrNfBESq241A68GCbN ansible@tfg2010
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAlGhVOjcg+fhOQnF5UXgTfCJr2lTSRdmJO5zeDxcEbR root@tfg2010
  EOT

  rootfs {
    storage = "local"
    size = "2G"
  }
  network {
    name = "eth0"
    bridge = "eth1"
    ip = "192.168.2.${count.index+101}/24"
    gw = "192.168.1.1"
  }
  
}