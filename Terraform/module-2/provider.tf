provider "proxmox" {
  endpoint = var.pm_api_url
  api_token = "${var.pm_api_token_id}=${var.Proxmox_API_Token_Secret}"
  insecure = var.pm_tls_insecure
}