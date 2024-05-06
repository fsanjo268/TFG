resource "proxmox_virtual_environment_vm" "Atacante" {
    name = "kali-1"
    node_name = "tfg2010"
    vm_id = 200
    agent {
        enabled = true
    }
    memory {
        dedicated = 4096
    }
    clone {
        datastore_id = "local"
        retries = 5
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
        dns {
            domain="10.0.0.250"
            servers=["10.0.0.250"]
        }
        user_account{
            keys=[trimspace(var.ssh_key_nodo_root),trimspace(var.ssh_key_nodo_ansible)]
            password=var.root-password
            username = "kali"
        }
        ip_config {
            ipv4 {
                address = "192.168.1.101/24"
                gateway = "192.168.1.1"
            }
        }
    }

    network_device{
        bridge = "vmbr0"
    }
    scsi_hardware = "virtio-scsi-single"
    keyboard_layout="es"
    timeout_clone = 3000
    timeout_create = 3000
}