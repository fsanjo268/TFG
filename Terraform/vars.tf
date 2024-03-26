variable "Proxmox_API_Token_Secret" {
  type = string
  sensitive = true
}

variable "lxc-password" {
  type = string
  sensitive = true
}

variable "pm_api_url" {
  default = "https://virtual.lab.inf.uva.es:20102/api2/json"
}

variable "pm_api_token_id" {
  description = "identificador del API Token Promox"
  type = string
  default = "terraformUSR@pam!token_promox_terraform"
}

variable "ssh_key" {
  description = "Clave SSH publica a insertar en lla maquina virtual"
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMhs1jtFG37tR6YVIvY+nWC3pb+SrKK8jRiweFodIHr usertfg@VirtualTFG"
}

variable "pm_node_name" {
  description = "nombre del nodo donde  crear la maquina virtual"
  type = string
  default = "tfg2010"
}

variable "pm_tls_insecure" {
  description = "Set to true to ignore certificate errors"
  type        = bool
  default     = true
}

