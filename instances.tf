# Creating servers instances

# Creating web server instance
resource "openstack_compute_instance_v2" "web_server" {
  name            = "web-server"
  image_id        = openstack_images_image_v2.bionic.id
  flavor_id       = openstack_compute_flavor_v2.server_flavor.id
  key_pair        = openstack_compute_keypair_v2.web_server_keypair.name
  user_data       = file("./scripts/webserver-boot.sh")

  network {
    port = openstack_networking_port_v2.web_port.id
  }
}

resource "openstack_networking_port_v2" "web_port" {
  name = "web-port"
  network_id = openstack_networking_network_v2.internal.id
  admin_state_up = true
  security_group_ids = [
    openstack_networking_secgroup_v2.ssh_secgroup.id,
    openstack_networking_secgroup_v2.web_servers_secgroup.id
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.servers_subnet.id
    ip_address = "192.168.2.80"
  }
}

# Creating mail server instance
resource "openstack_compute_instance_v2" "web_server" {
  name            = "mail-server"
  image_id        = openstack_images_image_v2.centos7.id
  flavor_id       = openstack_compute_flavor_v2.server_flavor.id
  key_pair        = openstack_compute_keypair_v2.mail_server_keypair.name

  network {
    port = openstack_networking_port_v2.mail_port.id
  }
}

resource "openstack_networking_port_v2" "mail_port" {
  name = "mail-port"
  network_id = openstack_networking_network_v2.internal.id
  admin_state_up = true
  security_group_ids = [
    openstack_networking_secgroup_v2.ssh_secgroup.id,
    openstack_networking_secgroup_v2.mail_servers_secgroup.id
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.servers_subnet.id
    ip_address = "192.168.2.25"
  }
}


# Creating dns server instance
resource "openstack_compute_instance_v2" "dns_server" {
  name            = "dns-server"
  image_id        = openstack_images_image_v2.centos7.id
  flavor_id       = openstack_compute_flavor_v2.server_flavor.id
  key_pair        = openstack_compute_keypair_v2.dns_server_keypair.name
  network {
    port = openstack_networking_port_v2.dns_port.id
  }
}

resource "openstack_networking_port_v2" "dns_port" {
  name = "dns-port"
  network_id = openstack_networking_network_v2.internal.id
  admin_state_up = true
  security_group_ids = [
    openstack_networking_secgroup_v2.ssh_secgroup.id,
    openstack_networking_secgroup_v2.dns_servers_secgroup.id
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.servers_subnet.id
    ip_address = "192.168.2.53"
  }
}

# Creating 2 instance for the office network

# Creating instance #1 of rancheros
resource "openstack_compute_instance_v2" "office_desktop_1" {
  name            = "office-desktop-1"
  image_id        = openstack_images_image_v2.rancheros.id
  flavor_id       = openstack_compute_flavor_v2.desktop_flavor.id
  key_pair        = openstack_compute_keypair_v2.office_keypair.name
  network {
    port = openstack_networking_port_v2.office_port_1.id
  }
}

resource "openstack_networking_port_v2" "office_port_1" {
  name = "office-port-1"
  network_id = openstack_networking_network_v2.internal.id
  admin_state_up = true
  security_group_ids = [
    openstack_networking_secgroup_v2.ssh_secgroup.id
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.office_subnet.id
    ip_address = "192.168.1.10"
  }
}

# Creating instance #2 of rancheros
resource "openstack_compute_instance_v2" "office_desktop_2" {
  name            = "office-desktop-2"
  image_id        = openstack_images_image_v2.rancheros.id
  flavor_id       = openstack_compute_flavor_v2.desktop_flavor.id
  key_pair        = openstack_compute_keypair_v2.office_keypair.name
  network {
    port = openstack_networking_port_v2.office_port_1.id
  }
}

resource "openstack_networking_port_v2" "office_port_1" {
  name = "office-port-2"
  network_id = openstack_networking_network_v2.internal.id
  admin_state_up = true
  security_group_ids = [
    openstack_networking_secgroup_v2.ssh_secgroup.id
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.office_subnet.id
    ip_address = "192.168.1.11"
  }
}