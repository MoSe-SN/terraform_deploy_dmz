# Web Server HTTP/HTTPS security group
resource "openstack_networking_secgroup_v2" "web_servers_secgroup" {
  name = "web-servers-secgroup"
  description = "Web Servers HTTP/HTTPS security group"
}

resource "openstack_networking_secgroup_rule_v2" "http-rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.web_servers_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "https-rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.web_servers_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "web_servers_secgroup-rule-v4" {
  direction         = "egress"
  ethertype         = "IPv4"
  security_group_id = "${openstack_networking_secgroup_v2.web_servers_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "web_servers_secgroup-rule-v6" {
  direction         = "egress"
  ethertype         = "IPv6"
  security_group_id = "${openstack_networking_secgroup_v2.web_servers_secgroup.id}"
}


# Domain Server DNS security group
resource "openstack_networking_secgroup_v2" "dns_servers_secgroup" {
  name = "dns-servers-secgroup"
  description = "Domain Servers DNS security group"
}

resource "openstack_networking_secgroup_rule_v2" "dns-tcp-rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 53
  port_range_max    = 53
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.dns_servers_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "dns-udp-rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 53
  port_range_max    = 53
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.dns_servers_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "dns_servers_secgroup-rule-v4" {
  direction         = "egress"
  ethertype         = "IPv4"
  security_group_id = "${openstack_networking_secgroup_v2.dns_servers_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "dns_servers_secgroup-rule-v6" {
  direction         = "egress"
  ethertype         = "IPv6"
  security_group_id = "${openstack_networking_secgroup_v2.dns_servers_secgroup.id}"
}


# Mail Server SMTP/SMTPS security group
resource "openstack_networking_secgroup_v2" "mail_servers_secgroup" {
  name = "mail-servers-secgroup"
  description = "Mail Server SMTP/SMTPS security group"
}

resource "openstack_networking_secgroup_rule_v2" "smtp-rule-1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 25
  port_range_max    = 25
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.mail_servers_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "smtp-rule-2" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 587
  port_range_max    = 587
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.mail_servers_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "smtp-rule-3" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 465
  port_range_max    = 465
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.mail_servers_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "smtp-rule-4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 2525
  port_range_max    = 2525
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.mail_servers_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "mail_servers_secgroup-rule-v4" {
  direction         = "egress"
  ethertype         = "IPv4"
  security_group_id = "${openstack_networking_secgroup_v2.mail_servers_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "mail_servers_secgroup-rule-v6" {
  direction         = "egress"
  ethertype         = "IPv6"
  security_group_id = "${openstack_networking_secgroup_v2.mail_servers_secgroup.id}"
}


# SSH Security Group
resource "openstack_networking_secgroup_v2" "ssh_secgroup" {
  name = "ssh-secgroup"
  description = "Open input SSH port"
}

resource "openstack_networking_secgroup_rule_v2" "ssh_secgroup-rule-v4" {
  direction         = "egress"
  ethertype         = "IPv4"
  security_group_id = "${openstack_networking_secgroup_v2.ssh_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "ssh_secgroup-rule-v6" {
  direction         = "egress"
  ethertype         = "IPv6"
  security_group_id = "${openstack_networking_secgroup_v2.ssh_secgroup.id}"
}

resource "openstack_networking_secgroup_rule_v2" "ssh-rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.ssh_secgroup.id}"
}