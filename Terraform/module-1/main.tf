/*-------- LXCs --------*/

resource "proxmox_lxc" "LXC_router" {

  hostname = "test-lxc-router-${count.index + 1}"
  count = 1
  target_node = var.pm_node_name
  vmid = 100 + count.index

  ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  cores = 1
  memory = 512
  start = true

  unprivileged = false
  password = var.root-password
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKskyaMLTz3C97I8k1gGQLWu/oxrNfBESq241A68GCbN ansible@tfg2010
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAlGhVOjcg+fhOQnF5UXgTfCJr2lTSRdmJO5zeDxcEbR root@tfg2010
  EOT

  rootfs {
    storage = "local"
    size = "2G"
  }

  //Node connection
  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "192.168.1.100/24"
    gw = "192.168.1.1"
  }

  //Attacker network
  network {
    name = "eth1"
    bridge = "vmbr0"
    ip = "192.168.2.100/24"
  }

  //DMZ Network
  network {
    name = "eth2"
    bridge = "vmbr0"
    ip = "192.168.3.100/24"
  }
  
}
resource "proxmox_lxc" "LXC_DMZ" {

  hostname = "test-lxc-dmz-${count.index + 1}"
  count = 1
  target_node = var.pm_node_name
  vmid = 300 + count.index

  ostemplate = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  cores = 1
  memory = 512
  start = true

  unprivileged = false
  password = var.root-password
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKskyaMLTz3C97I8k1gGQLWu/oxrNfBESq241A68GCbN ansible@tfg2010
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAlGhVOjcg+fhOQnF5UXgTfCJr2lTSRdmJO5zeDxcEbR root@tfg2010
  EOT

  rootfs {
    storage = "local"
    size = "2G"
  }

  //Node connection
   network {
    name = "eth0"
    bridge = "vmbr0"
    ip = "192.168.1.102/24"
    gw = "192.168.1.1"
  }

  //Router connnection
  network {
    name = "eth1"
    bridge = "vmbr0"
    ip = "192.168.3.${count.index+101}/24"
    gw = "192.168.3.100"
  }
  
}

/*-------- VMs --------*/

resource "proxmox_vm_qemu" "VM_Atacante" {

  name = "kali-${count.index + 1}"
  count = 1
  target_node = var.pm_node_name
  vmid = 200 + count.index
  cipassword = var.root-password

  clone = var.template_name
  cores = 4
  memory = 4096
  agent = 1
  os_type = "cloud-init"
  sockets = 1
  cpu = "host"
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  
  disks {
    scsi{
      scsi0{
        disk{
          size = 80
          storage = "local"
          iothread = false
        }
      }
    }
  }
  /*disk {
    slot = 0
    size = "20G"
    type = "scsi"
    storage = "local"
    iothread = 1
  }*/

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  /*network {
    model = "virtio"
    bridge = "vmbr0"
  }*/

  lifecycle {
    ignore_changes = [ 
      network,
    ]
  }
  cloudinit_cdrom_storage = "local"
  boot = "order=scsi0;ide2;net0"

  //Node connection
  ipconfig0 = "ip=192.168.1.101/24,gw=192.168.1.1"
  //Router connection
  //ipconfig1 = "ip = 192.168.2.101/24, gw = 192.168.2.100"
  //DNS
  searchdomain = "10.0.0.250"
  nameserver = "10.0.0.250"

  sshkeys = <<EOF
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKskyaMLTz3C97I8k1gGQLWu/oxrNfBESq241A68GCbN ansible@tfg2010
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAlGhVOjcg+fhOQnF5UXgTfCJr2lTSRdmJO5zeDxcEbR root@tfg2010
  EOF
}

