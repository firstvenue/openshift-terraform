module "openshift_digitalocean" {
  source            = "./openshift_digitalocean"
  key_name          = "${var.key_name}"
  public_key        = "${var.public_key}"
  region            = "${var.region}"
  master_size       = "${var.master_size}"
  #node_sizes        = ["${split(",", join(",", var.node_sizes))}"]
  #node_regions      = ["${split(",", join(",", var.node_regions))}"]
  domain            = "${var.domain}"
}
