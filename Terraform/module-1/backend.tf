terraform {
  required_providers {
    proxmox = {
        source = "bpg/proxmox"
        version = "0.55.0"
    }
  }
  /*backend "local" {
  }*/
}