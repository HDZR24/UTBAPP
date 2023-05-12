terraform {
  backend "s3" {
  bucket = "terraform-state-bucket-kio185"
  key = "terraform.tfstate"
  region = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1"
}
variable "imagebuild" {
  type = string
  description = "the latest image build version"
}
resource "aws_ecr_repository" "devops-test-repo" {
  name = "devops-test-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
  scan_on_push = true
  }

}
