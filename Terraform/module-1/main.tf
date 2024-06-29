resource "proxmox_virtual_environment_vm" "VM_Kali_Attacker" {
    
    name = "QEMU-kali-1"
    node_name = "tfg2010"
    //New VM id to set
    vm_id = 200
    scsi_hardware = "virtio-scsi-single"

    timeout_clone = 3600
    timeout_create = 3000

    agent {
        enabled = true
        timeout = "20m"
    }

    memory {
        dedicated = 8192
    }

    clone {
        datastore_id = "local"
        retries = 8
        //id from the template
        vm_id = 1000
        full = true
    }

    cpu {
        cores = 4
        sockets = 1
        type = "host"
    }

    disk{
        size= 80
        interface="scsi0"
        datastore_id = "local"
    }

    initialization {
        datastore_id = "local"
        upgrade = true
        dns {
            domain="10.0.0.250"
            servers=["10.0.0.250"]
        }

        user_account{
            keys=[trimspace(var.ssh_key_nodo_root),trimspace(var.ssh_key_nodo_ansible)]
            password=var.root-password
            username = "kali"
        }
        //Node Network
        ip_config {
            ipv4 {
                address = "192.168.1.101/24"
                gateway = "192.168.1.1"
            }
        }
        //Attacker Network
        ip_config {
            ipv4 {
                address = "192.168.2.101/24"
                gateway = "192.168.2.100"
            }
        }
    }

    network_device{
        bridge = "vmbr0"
    }

    network_device{
        bridge = "vmbr0"
    }
}

resource "proxmox_virtual_environment_container" "LXC_Ubuntu_Intranet" {

  depends_on = [ proxmox_virtual_environment_vm.VM_Kali_Attacker ]

  count = 2
  node_name = "tfg2010"
  vm_id = "30${count.index}"
  started = true
  unprivileged = false
  timeout_create = 3000

  operating_system {
    template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
    type = "ubuntu"
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 1024
  }

  network_interface {
    name = "eth0"
    bridge = "vmbr0"
  }

  network_interface {
    name = "eth1"
    bridge = "vmbr0"
  }

  disk {
    datastore_id = "local"
    size = 10
  }

  initialization {
    
    dns {
      domain = "10.0.0.250"
      servers = ["10.0.0.250"]
    }

    hostname = "LXC-ub-in-${count.index+1}"

    //Node Network
    ip_config {
      ipv4 {
        address = "192.168.1.10${(count.index+3)-1}/24"
        gateway = "192.168.1.1"
      }
    }

    //Intranet Network
    ip_config {
      ipv4 {
        address = "192.168.3.10${count.index+1}/24"
        gateway = "192.168.3.100"
      }
    }

    user_account{
        keys=[trimspace(var.ssh_key_nodo_root),trimspace(var.ssh_key_nodo_ansible)]
        password=var.root-password
    }
  }
}

resource "proxmox_virtual_environment_container" "LXC_Ubuntu_Router" {
  
  depends_on = [ proxmox_virtual_environment_vm.VM_Kali_Attacker ]

  node_name = "tfg2010"
  vm_id =100
  started = true
  unprivileged = false
  timeout_create = 3000

  operating_system {
    template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
    type = "ubuntu"
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 512
  }

  network_interface {
    name = "eth0"
    bridge = "vmbr0"
  }

  network_interface {
    name = "eth1"
    bridge = "vmbr0"
  }

  network_interface {
    name = "eth2"
    bridge = "vmbr0"
  }


  disk {
    datastore_id = "local"
    size = 10
  }

  initialization {
    dns {
      domain = "10.0.0.250"
      servers = ["10.0.0.250"]
    }

    hostname = "LXC-ub-ro-1"

    //Node Network
    ip_config {
      ipv4 {
        address = "192.168.1.100/24"
        gateway = "192.168.1.1"
      }
    }

    //Attacker Network
    ip_config {
      ipv4 {
        address = "192.168.2.100/24"
      }
    }

    //Intranet Network
    ip_config {
      ipv4 {
        address = "192.168.3.100/24"
      }
    }
    user_account{
        keys=[trimspace(var.ssh_key_nodo_root),trimspace(var.ssh_key_nodo_ansible)]
        password=var.root-password
    }
  }
}