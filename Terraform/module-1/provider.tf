provider "proxmox" {
  /*pm_api_url*/endpoint = var.pm_api_url
  /*pm_api_token_id*/api_token = "${var.pm_api_token_id}=${var.Proxmox_API_Token_Secret}"
  /*pm_api_token_secret= var.Proxmox_API_Token_Secret*/
  /*pm_tls_*/insecure = var.pm_tls_insecure
  //pm_timeout = 700
}