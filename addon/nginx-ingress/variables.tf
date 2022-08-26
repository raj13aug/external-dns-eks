variable "namespace" {
  default     = "ingress"
  description = "What namespace to create controller in."
  type        = string
}

variable "create_namespace" {
  type        = bool
  default     = true
  description = "Whether to create namespace if it doesn't exist."
}
