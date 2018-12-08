#To output variables, follow pattern:
#value = "${TYPE.NAME.ATTR}

output "Network name" {
    value = "${openstack_networking_network_v2.frontend_network.name}"
}

output "Subnet ID" {
	description = "Outputs the ID of the created subnet"
    value = "${openstack_networking_subnet_v2.frontend_subnet.network_id}"
}

output "web1 IP"	{
	value = "${openstack_compute_instance_v2.web1.access_ip_v4} initialized with success"
}

output "web2 IP"	{
	value = "${openstack_compute_instance_v2.web2.access_ip_v4} initialized with success"
}


output "private key"	{
	value = "${file(var.ssh_key_private)}"
}

output "public key"	{
	value = "${file(var.ssh_key_public)}"
}

