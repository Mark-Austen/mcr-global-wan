// Perth MCR

data "megaport_location" "per_location_1" {
  name = "NextDC P1"
}

resource "megaport_mcr" "per_mcr_1" {
  product_name         = "PER MCR 1"
  location_id          = data.megaport_location.per_location_1.id
  contract_term_months = 1
  port_speed           = 1000
  asn                  = 65001
}

// Melbourne MCR

data "megaport_location" "mel_location_1" {
  name = "NextDC M1"
}

resource "megaport_mcr" "mel_mcr_1" {
  product_name         = "MEL MCR 1"
  location_id          = data.megaport_location.mel_location_1.id
  contract_term_months = 1
  port_speed           = 1000
  asn                  = 65002
}

// Sydney MCR

data "megaport_location" "syd_location_1" {
  name = "NextDC S1"
}

resource "megaport_mcr" "syd_mcr_1" {
  product_name         = "SYD MCR 1"
  location_id          = data.megaport_location.syd_location_1.id
  contract_term_months = 1
  port_speed           = 1000
  asn                  = 65003
}

// Auckland MCR

data "megaport_location" "akl_location_1" {
  name = "Spark Mayoral Drive"
}

resource "megaport_mcr" "akl_mcr_1" {
  product_name         = "AKL MCR 1"
  location_id          = data.megaport_location.akl_location_1.id
  contract_term_months = 1
  port_speed           = 1000
  asn                  = 65004
}

// Singapore MCR

data "megaport_location" "sin_location_1" {
  name = "Digital Realty Singapore SIN10"
}

resource "megaport_mcr" "sin_mcr_1" {
  product_name         = "SIN MCR 1"
  location_id          = data.megaport_location.sin_location_1.id
  contract_term_months = 1
  port_speed           = 1000
  asn                  = 65005
}

// VXC - PER - MEL

resource "megaport_vxc" "per_mcr_1_mel_mcr_1" {
  product_name         = "PER MCR 1 to MEL MCR 1"
  rate_limit           = 1000
  contract_term_months = 1
  a_end = {
    requested_product_uid = megaport_mcr.per_mcr_1.product_uid
  }
  a_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.1.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65002
              local_ip_address = "10.1.1.1"
              peer_ip_address  = "10.1.1.2"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
  b_end = {
    requested_product_uid = megaport_mcr.mel_mcr_1.product_uid
  }
  b_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.1.2/30"]
          bgp_connections = [
            {
              peer_asn         = 65001
              local_ip_address = "10.1.1.2"
              peer_ip_address  = "10.1.1.1"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
}

// VXC - PER - SYD

resource "megaport_vxc" "per_mcr_1_syd_mcr_1" {
  product_name         = "PER MCR 1 to SYD MCR 1"
  rate_limit           = 1000
  contract_term_months = 1
  a_end = {
    requested_product_uid = megaport_mcr.per_mcr_1.product_uid
  }
  a_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.2.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65003
              local_ip_address = "10.1.2.1"
              peer_ip_address  = "10.1.2.2"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
  b_end = {
    requested_product_uid = megaport_mcr.syd_mcr_1.product_uid
  }
  b_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.2.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65001
              local_ip_address = "10.1.2.2"
              peer_ip_address  = "10.1.2.1"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
}

// VXC - PER - AKL

resource "megaport_vxc" "per_mcr_1_akl_mcr_1" {
  product_name         = "PER MCR 1 to AKL MCR 1"
  rate_limit           = 1000
  contract_term_months = 1
  a_end = {
    requested_product_uid = megaport_mcr.per_mcr_1.product_uid
  }
  a_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.3.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65004
              local_ip_address = "10.1.3.1"
              peer_ip_address  = "10.1.3.2"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
  b_end = {
    requested_product_uid = megaport_mcr.akl_mcr_1.product_uid
  }
  b_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.3.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65001
              local_ip_address = "10.1.3.2"
              peer_ip_address  = "10.1.3.1"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
}

// VXC - PER - SIN

resource "megaport_vxc" "per_mcr_1_sin_mcr_1" {
  product_name         = "PER MCR 1 to SIN MCR 1"
  rate_limit           = 1000
  contract_term_months = 1
  a_end = {
    requested_product_uid = megaport_mcr.per_mcr_1.product_uid
  }
  a_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.4.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65005
              local_ip_address = "10.1.4.1"
              peer_ip_address  = "10.1.4.2"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
  b_end = {
    requested_product_uid = megaport_mcr.sin_mcr_1.product_uid
  }
  b_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.4.2/30"]
          bgp_connections = [
            {
              peer_asn         = 65001
              local_ip_address = "10.1.4.2"
              peer_ip_address  = "10.1.4.1"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
}

// VXC - MEL - SYD

resource "megaport_vxc" "mel_mcr_1_syd_mcr_1" {
  product_name         = "MEL MCR 1 to SYD MCR 1"
  rate_limit           = 1000
  contract_term_months = 1
  a_end = {
    requested_product_uid = megaport_mcr.mel_mcr_1.product_uid
  }
  a_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.5.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65003
              local_ip_address = "10.1.5.1"
              peer_ip_address  = "10.1.5.2"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
  b_end = {
    requested_product_uid = megaport_mcr.syd_mcr_1.product_uid
  }
  b_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.5.2/30"]
          bgp_connections = [
            {
              peer_asn         = 65002
              local_ip_address = "10.1.5.2"
              peer_ip_address  = "10.1.5.1"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
}

// VXC - MEL - AKL

resource "megaport_vxc" "mel_mcr_1_akl_mcr_1" {
  product_name         = "MEL MCR 1 to AKL MCR 1"
  rate_limit           = 1000
  contract_term_months = 1
  a_end = {
    requested_product_uid = megaport_mcr.mel_mcr_1.product_uid
  }
  a_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.6.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65004
              local_ip_address = "10.1.6.1"
              peer_ip_address  = "10.1.6.2"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
  b_end = {
    requested_product_uid = megaport_mcr.akl_mcr_1.product_uid
  }
  b_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.6.2/30"]
          bgp_connections = [
            {
              peer_asn         = 65002
              local_ip_address = "10.1.6.2"
              peer_ip_address  = "10.1.6.1"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
}

// VXC - MEL - SIN

resource "megaport_vxc" "mel_mcr_1_sin_mcr_1" {
  product_name         = "MEL MCR 1 to SIN MCR 1"
  rate_limit           = 1000
  contract_term_months = 1
  a_end = {
    requested_product_uid = megaport_mcr.mel_mcr_1.product_uid
  }
  a_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.7.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65005
              local_ip_address = "10.1.7.1"
              peer_ip_address  = "10.1.7.2"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
  b_end = {
    requested_product_uid = megaport_mcr.sin_mcr_1.product_uid
  }
  b_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.7.2/30"]
          bgp_connections = [
            {
              peer_asn         = 65002
              local_ip_address = "10.1.7.2"
              peer_ip_address  = "10.1.7.1"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
}

// VXC - SYD - AKL

resource "megaport_vxc" "syd_mcr_1_akl_mcr_1" {
  product_name         = "SYD MCR 1 to AKL MCR 1"
  rate_limit           = 1000
  contract_term_months = 1
  a_end = {
    requested_product_uid = megaport_mcr.syd_mcr_1.product_uid
  }
  a_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.8.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65004
              local_ip_address = "10.1.8.1"
              peer_ip_address  = "10.1.8.2"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
  b_end = {
    requested_product_uid = megaport_mcr.akl_mcr_1.product_uid
  }
  b_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.8.2/30"]
          bgp_connections = [
            {
              peer_asn         = 65003
              local_ip_address = "10.1.8.2"
              peer_ip_address  = "10.1.8.1"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
}

// VXC - SYD - SIN

resource "megaport_vxc" "syd_mcr_1_sin_mcr_1" {
  product_name         = "SYD MCR 1 to SIN MCR 1"
  rate_limit           = 1000
  contract_term_months = 1
  a_end = {
    requested_product_uid = megaport_mcr.syd_mcr_1.product_uid
  }
  a_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.9.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65005
              local_ip_address = "10.1.9.1"
              peer_ip_address  = "10.1.9.2"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
  b_end = {
    requested_product_uid = megaport_mcr.sin_mcr_1.product_uid
  }
  b_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.9.2/30"]
          bgp_connections = [
            {
              peer_asn         = 65003
              local_ip_address = "10.1.9.2"
              peer_ip_address  = "10.1.9.1"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
}

// VXC - AKL - SIN

resource "megaport_vxc" "akl_mcr_1_sin_mcr_1" {
  product_name         = "AKL MCR 1 to SIN MCR 1"
  rate_limit           = 1000
  contract_term_months = 1
  a_end = {
    requested_product_uid = megaport_mcr.akl_mcr_1.product_uid
  }
  a_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.10.1/30"]
          bgp_connections = [
            {
              peer_asn         = 65005
              local_ip_address = "10.1.10.1"
              peer_ip_address  = "10.1.10.2"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
  b_end = {
    requested_product_uid = megaport_mcr.sin_mcr_1.product_uid
  }
  b_end_partner_config = {
    partner = "vrouter"
    vrouter_config = {
      interfaces = [
        {
          ip_addresses     = ["10.1.10.2/30"]
          bgp_connections = [
            {
              peer_asn         = 65004
              local_ip_address = "10.1.10.2"
              peer_ip_address  = "10.1.10.1"
              shutdown         = false
            }
          ]
        }
      ]
    }
  }
}
