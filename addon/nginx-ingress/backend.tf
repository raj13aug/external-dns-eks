terraform {
  backend "s3" {
    encrypt = true
    bucket  = "tf-backend-tikal-task"
    key     = "tf-state-nginx-ingress/terraform.tfstate"
    region  = "eu-central-1"
  }
}    