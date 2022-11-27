# Importing RancherOS image
resource "openstack_images_image_v2" "rancheros" {
  name             = "rancheros"
  container_format = "bare"
  disk_format      = "qcow2"
  local_file_path  = "./images/rancheros-openstack.img"
}

# Importing CentOS-7 image
resource "openstack_images_image_v2" "centos7" {
  name             = "centos7"
  container_format = "bare"
  disk_format      = "qcow2"
  local_file_path  = "./images/CentOS-7-x86_64-GenericCloud.qcow2"
}

# Importing Debian-10 image
resource "openstack_images_image_v2" "debian10" {
  name             = "debian10"
  container_format = "bare"
  disk_format      = "qcow2"
  local_file_path  = "./images/debian-10.13.8-20221118-openstack-amd64.qcow2"
}

# Importing Bionic Ubuntu image
resource "openstack_images_image_v2" "bionic" {
  name             = "bionic"
  container_format = "bare"
  disk_format      = "qcow2"
  local_file_path  = "./images/bionic-server-cloudimg-amd64.img"
}
