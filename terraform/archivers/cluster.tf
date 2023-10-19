resource "vultr_kubernetes" "cluster" {
  region  = "icn"
  label   = "archivers-cluster"
  version = "v1.28.2+1"

#    node_pools {
#      label         = "pregenerated"
#      node_quantity = 1
#      plan          = "vc2-1c-2gb"
#    }
}

resource "vultr_kubernetes_node_pools" "archivers-main" {
  cluster_id    = vultr_kubernetes.cluster.id
  label         = "archivers-main"
  plan          = "vc2-2c-4gb"
  node_quantity = 3
  auto_scaler   = true
  min_nodes     = 3
  max_nodes     = 6
}

resource "vultr_kubernetes_node_pools" "archivers-pipeline" {
  cluster_id    = vultr_kubernetes.cluster.id
  label         = "archivers-pipeline"
  plan          = "vc2-2c-4gb"
  node_quantity = 2
  auto_scaler   = true
  min_nodes     = 2
  max_nodes     = 10
}

resource "vultr_kubernetes_node_pools" "archivers-worker" {
  cluster_id    = vultr_kubernetes.cluster.id
  label         = "archivers-worker"
  plan          = "vc2-2c-4gb"
  node_quantity = 2
  auto_scaler   = true
  min_nodes     = 2
  max_nodes     = 20
}

#resource "vultr_kubernetes_node_pools" "archivers-sub" {
#  cluster_id    = vultr_kubernetes.cluster.id
#  label         = "archivers-sub"
#  plan          = "vc2-2c-4gb"
#  node_quantity = 1
#  auto_scaler   = true
#  min_nodes     = 1
#  max_nodes     = 2
#}
