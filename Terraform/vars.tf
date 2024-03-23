variable "Promox_API_Token_Secret" {
  type = string
}
variable "pm_api_url" {
  default = "https://virtual.lab.inf.uva.es:20102/api2/json"
}
variable "pm_api_token_id" {
  default = "terraformUSR@pam!token_promox_terraform"
}

variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMhs1jtFG37tR6YVIvY+nWC3pb+SrKK8jRiweFodIHr usertfg@VirtualTFG"
}

variable "proxmox_host" {
  default = "proxmox"
}
variable "template_name" {
  default = "debian11.vm.shiwaforce.com"
}

