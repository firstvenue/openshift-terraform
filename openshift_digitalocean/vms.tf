//  Create an SSH keypair
resource "digitalocean_ssh_key" "keypair" {
  name       = "${var.key_name}"
  public_key = "${var.public_key}"
}

resource "digitalocean_tag" "cluster" {
  name = "${var.domain}"
}

resource "digitalocean_droplet" "master" {
  image              = "${var.image}"
  name               = "${var.master_hostname}"
  region             = "${var.region}"
  size               = "${var.master_size}"
  ssh_keys           = ["${digitalocean_ssh_key.keypair.id}"]
  count              = 1
  private_networking = true
  tags               = ["${digitalocean_tag.cluster.name}"]
}

resource "digitalocean_droplet" "nodes" {
  image      = "${var.image}"
  name       = "${format("%s%02d", var.node_prefix, count.index + 1)}"
  region     = "${var.node_regions[count.index]}"
  size       = "${var.node_sizes[count.index]}"
  ssh_keys   = ["${digitalocean_ssh_key.keypair.id}"]
  count      = "${length(var.node_sizes)}"
  tags       = ["${digitalocean_tag.cluster.name}"]
}
