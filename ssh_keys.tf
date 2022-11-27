# Creating office SSH key
resource "openstack_compute_keypair_v2" "office_keypair" {
  name = "office-keypair"
}

# Creating 3 keypairs for each server (HTTP, DNS, SMTP)
resource "openstack_compute_keypair_v2" "web_server_keypair" {
  name = "web-server-keypair"
}

resource "openstack_compute_keypair_v2" "dns_server_keypair" {
  name = "dns-server-keypair"
}

resource "openstack_compute_keypair_v2" "mail_server_keypair" {
  name = "mail-server-keypair"
}
