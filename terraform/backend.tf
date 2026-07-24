# S3 backend for Terraform state
# IMPORTANT: Follow these steps to enable the remote backend:
#
# 1. First run: `cd terraform && terraform init`
#    This initializes with local state.
#
# 2. Create the S3 backend resources manually or via Terraform (using local state):
#    - S3 bucket for state (with versioning enabled)
#    - DynamoDB table for state locking (LockID partition key)
#
# 3. Uncomment the backend block below
#
# 4. Run: `terraform init -migrate-state`
#    Terraform will detect the backend config and migrate state from local to S3
#
# 5. Confirm the migration by typing 'yes' when prompted

# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-bucket-name"  # Replace with your state bucket
#     key            = "portfolio-site/terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "terraform-locks"
#   }
# }
