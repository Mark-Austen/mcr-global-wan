terraform {
  required_providers {
    megaport = {
      source  = "megaport/megaport"
      version = "1.1.8"
    }
  }
}

provider "megaport" {
  access_key            = "<access_key>"
  secret_key            = "<secret_key"
  accept_purchase_terms = true
  environment           = "staging"
}
