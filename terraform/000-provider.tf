# Define AWS Provider
provider "aws" {
  version = "~> 2.0"
  profile = var.buckhill-test-profile
  region  = var.buckhill-test-region
}


