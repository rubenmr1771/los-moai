###################
## Variables AKS ##
###################

variable "cluster_name" {
  type = string
  description = "Nombre AKS en Microsoft Azure"
}
variable "kubernetes_version" {
  type = string
  description = "Version de Kubernetes"
}
variable "system_node_count" {
  type = number
  description = "Número de nodos de AKS"
}
variable "node_resource_group" {
  type = string
  description = "Nombre del RG para el cluster de recursos"
}
