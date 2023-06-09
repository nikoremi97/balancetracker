terraform {
  backend "s3" {
    bucket         = "tf-balance-tracker-backend"
    region         = "us-east-1"
    dynamodb_table = "tf_state_balance_tracker"
    key            = "compute/terraform.tfstate"
  }
}