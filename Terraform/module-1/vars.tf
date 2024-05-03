variable "Proxmox_API_Token_Secret" {
  type = string
  sensitive = true
}

variable "root-password" {
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

variable "ssh_key_nodo_ansible" {
  description = "Clave SSH publica del nodo Proxmox ansible a insertar en la maquina virtual"
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKskyaMLTz3C97I8k1gGQLWu/oxrNfBESq241A68GCbN ansible@tfg2010"
}

variable "ssh_key_nodo_root" {
  description = "Clave SSH publica del nodo Proxmox root a insertar en la maquina virtual"
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAlGhVOjcg+fhOQnF5UXgTfCJr2lTSRdmJO5zeDxcEbR root@tfg2010"
}

variable "pm_node_name" {
  description = "nombre del nodo donde  crear la maquina virtual"
  type = string
  default = "tfg2010"
}

variable "template_name" {
  description = "nombre de la plantilla donde clonar la maquina virtual"
  type = string
  default = "template-kali"
}

variable "pm_tls_insecure" {
  description = "Set to true to ignore certificate errors"
  type        = bool
  default     = true
}

