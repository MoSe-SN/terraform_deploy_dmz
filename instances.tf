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
resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "ad091b52-742f-469e-8f3c-fd81cadf0743"
  flavor_id       = "3"
  key_pair        = "my_key_pair_name"
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = "my_network"
  }
}

# Creating dns server instance
resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "ad091b52-742f-469e-8f3c-fd81cadf0743"
  flavor_id       = "3"
  key_pair        = "my_key_pair_name"
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = "my_network"
  }
}

# Creating 2 instance for the office network

# Creating instance #1 of rancheros
resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "ad091b52-742f-469e-8f3c-fd81cadf0743"
  flavor_id       = "3"
  key_pair        = "my_key_pair_name"
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = "my_network"
  }
}

# Creating instance #2 of rancheros
resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "ad091b52-742f-469e-8f3c-fd81cadf0743"
  flavor_id       = "3"
  key_pair        = "my_key_pair_name"
  security_groups = ["default"]

  metadata = {
    this = "that"
  }

  network {
    name = "my_network"
  }
}