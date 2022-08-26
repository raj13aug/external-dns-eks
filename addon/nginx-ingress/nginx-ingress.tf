provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx_ingress" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = var.namespace
  create_namespace = var.create_namespace

  provisioner "local-exec" {
    command = <<EOF
      echo "Waiting for the nginx ingress controller pods"
      kubectl wait --namespace ingress \
      --for=condition=ready pod \
      --selector=app.kubernetes.io/component=controller \
      --timeout=120s
      echo "Nginx ingress controller successfully started"
    EOF
  }
}