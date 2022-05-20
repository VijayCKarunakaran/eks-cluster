terraform {
  backend "s3" {
    bucket  = "eks-cluster-bucket"
    key     = "eks-cluster/terraformstate/terraform.tfstate"
    region  = "eu-central-1"
    profile = "default"
  }
}