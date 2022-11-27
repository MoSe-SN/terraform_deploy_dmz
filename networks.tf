# Creating router
resource "openstack_networking_router_v2" "router" {
  name = "router-generic"
  external_network_id = var.external_network
}

# Creating internal network
resource "openstack_networking_network_v2" "internal" {
  name = "internal-network"
}

# Creating servers subnet
resource "openstack_networking_subnet_v2" "servers_subnet" {
  name = var.servers_network["subnet_name"]
  network_id = openstack_networking_network_v2.internal.id
  cidr = var.servers_network["cidr"]
  enable_dhcp = false
  gateway_ip = var.servers_network["gateway_ip"]
  dns_nameservers = var.dns_ip
}

# Creating office subnet
resource "openstack_networking_subnet_v2" "office_subnet" {
  name = var.office_network["subnet_name"]
  network_id = openstack_networking_network_v2.internal.id
  cidr = var.office_network["cidr"]
  enable_dhcp = true
  gateway_ip = var.office_network["gateway_ip"]
  dns_nameservers = var.dns_ip
}

# Router ports configuration

# Router interfaces configuration
resource "openstack_networking_router_interface_v2" "servers_interface" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.servers_subnet.id
  // maybe add port_id ?
}

resource "openstack_networking_router_interface_v2" "office_interface" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.office_subnet.id
  // maybe add port_id ?
}

