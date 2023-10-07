resource "vultr_kubernetes" "k8s" {
  region = "icn"
  label     = "management-cluster"
  version = "v1.28.2+1"

#  node_pools {
#    label         = "mgmt-pregenerated"
#    node_quantity = 1
#    plan          = "vc2-1c-2gb"
#  }
}

resource "vultr_kubernetes_node_pools" "np2" {
  cluster_id    = vultr_kubernetes.k8s.id
  label         = "mgmt-large"
  plan          = "vc2-4c-8gb"
  node_quantity = 3
  auto_scaler   = true
  min_nodes     = 3
  max_nodes     = 6
}

