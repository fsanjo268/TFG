

resource "proxmox_virtual_environment_container" "LXC_Ubuntu_DMZ" {
  
  count = 1
  node_name = "tfg2010"
  vm_id =300
  started = true
  unprivileged = false

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

  disk {
    datastore_id = "local"
    size = 10
  }

  initialization {
    
    dns {
      domain = "10.0.0.250"
      servers = ["10.0.0.250"]
    }

    hostname = "LXC-ubuntu-dmz-${count.index+1}"

    //Node Networkk
    ip_config {
      ipv4 {
        address = "192.168.1.102/24"
        gateway = "192.168.1.1"
      }
    }

    //DMZ Network
    ip_config {
      ipv4 {
        address = "192.168.3.101/24"
        gateway = "192.168.3.100"
      }
    }

    user_account{
        keys=[trimspace(var.ssh_key_nodo_root),trimspace(var.ssh_key_nodo_ansible)]
        password=var.root-password
    }
  }

  timeout_create = 3000
}

resource "proxmox_virtual_environment_container" "LXC_Ubuntu_Router" {
  

  count = 1
  node_name = "tfg2010"
  vm_id =100
  started = true
  unprivileged = false
  
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


  disk {
    datastore_id = "local"
    size = 10
  }

  initialization {
    dns {
      domain = "10.0.0.250"
      servers = ["10.0.0.250"]
    }

    hostname = "LXC-ubuntu-router-${count.index+1}"

    //Node Networkk
    ip_config {
      ipv4 {
        address = "192.168.1.100/24"
        gateway = "192.168.1.1"
      }
    }


    //DMZ Network
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

  timeout_create = 3000
}