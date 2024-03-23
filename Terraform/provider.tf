provider "proxmox" {
  pm_api_url = var.pm_api_url
  # api token id is in the form of: <username>@pam!<tokenId>
  pm_api_token_id = var.pm_api_token_id
  # this is the full secret wrapped in quotes.
  pm_api_token_secret = var.Promox_API_Token_Secret
  pm_tls_insecure     = true

  # debug log
  #  pm_log_enable = true
  #  pm_log_file   = "terraform-plugin-proxmox.log"
  #  pm_debug      = true
  #  pm_log_levels = {
  #    _default    = "debug"
  #    _capturelog = ""
  #  }
}