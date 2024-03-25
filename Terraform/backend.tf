terraform {
  required_providers {
    promox = {
        source = "telmate/promox"
        version = "2.9.11"
    }
  }
  backend "local" {
  }
}