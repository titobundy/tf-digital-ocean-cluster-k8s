# provider "digitalocean" {
#   # You need to set this in your .bashrc
#   # export DIGITALOCEAN_TOKEN="Your API TOKEN"
#   #
# }

variable "do_token" {}

# Get a Digital Ocean token from your Digital Ocean account
#   See: https://www.digitalocean.com/docs/api/create-personal-access-token/
# Set TF_VAR_do_token to use your Digital Ocean token automatically
provider "digitalocean" {
  token = "${var.do_token}"
}

variable "cluster-name" {}
variable "cluster-region" {}
variable "cluster-version" {}
variable "cluster-node-pool-name" {}
variable "cluster-node-pool-size" {}
variable "cluster-node-pool-node-count" {}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = "${var.cluster-name}"
  region  = "${var.cluster-region}"
  version = "${var.cluster-version}"
  tags = ["${var.cluster-name}"]

  node_pool {
    name       = "${var.cluster-node-pool-name}"
    size       = "${var.cluster-node-pool-size}"
    node_count = "${var.cluster-node-pool-node-count}"
  }
}