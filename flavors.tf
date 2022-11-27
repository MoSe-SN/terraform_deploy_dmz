resource "openstack_compute_flavor_v2" "server_flavor" {
  name  = var.server_flavor["name"]
  ram   = var.server_flavor["ram"]
  vcpus = var.server_flavor["vcpus"]
  disk  = var.server_flavor["disk"]
}

resource "openstack_compute_flavor_v2" "desktop_flavor" {
  name  = var.desktop_flavor["name"]
  ram   = var.desktop_flavor["ram"]
  vcpus = var.desktop_flavor["vcpus"]
  disk  = var.desktop_flavor["disk"]
}