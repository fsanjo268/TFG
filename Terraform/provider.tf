provider "proxmox" {
  pm_api_url = var.pm_api_url
  pm_api_token_id = var.pm_api_token_id
  pm_api_token_secret = var.Proxmox_API_Token_Secret
  pm_tls_insecure = var.pm_tls_insecure
}