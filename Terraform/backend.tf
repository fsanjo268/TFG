terraform {
  required_providers {
    promox = {
        source = "telmate/promox"
        version = "2.911"
    }
  }
  backend "local" {
  }
}