# Glance variables



# Neutron variables
variable "external_network_pool" {
  type    = string
  default = "public1"
}

# UUID of external network
variable "external_network" {
  type        = string
  default     = "9cd4fa81-8616-4a2d-af0f-a910890b7e52"
  description = "This is the UUID of the external network public1"
}

variable "dns_ip" {
  type    = list(string)
  default = ["192.168.2.53"]
}

# VM parameters
variable "flavor_server" {
  type = map(string)
  default = {
    name = "t1.server"
    ram = "1024"
    vcpus = "2"
    disk = "20"
  }
}
variable "flavor_desktop" {
  type = map(string)
  default = {
    name = "t1.desktop"
    ram = "512"
    vcpus = "1"
    disk = "10"
  }
}

# Network parameters
variable "servers_network" {
  type = map(string)
  default = {
    subnet_name = "servers-subnet"
    cidr        = "192.168.2.0/24"
    gateway_ip  = "192.168.2.1"
  }
}

variable "office_network" {
  type = map(string)
  default = {
    subnet_name = "office-subnet"
    cidr        = "192.168.1.0/24"
    gateway_ip  = "192.168.1.1"
  }
}