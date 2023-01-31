#https://registry.terraform.io/providers/fortinetdev/fortios/latest
terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = "1.16.0"
    }
  }
}

#https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs
provider "fortios" {
  hostname = var.fortigate_ip
  token    = var.fortigate_api_token
  insecure = "true"
}

#https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/fortios_firewall_address
resource "fortios_firewall_address" "dhcp" {
  name                 = "dhcp-pool"
  start_ip             = "10.0.5.1"
  end_ip               = "10.0.5.254"
  associated_interface = "lan"
  type                 = "iprange"
  visibility           = "enable"
}