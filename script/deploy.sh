#!/bin/bash
source ./variables.sh

# DEPLOY
cd ..
cd deployment
terraform init -backend-config="key=${TF_state_file_name}" -backend-config="bucket=${TF_state_s3_bucket_name}" -backend-config="region=${TF_region}" -backend-config="access_key=${TF_access_key}" -backend-config="secret_key=${TF_secret_key}"
terraform validate
terraform plan
terraform apply -auto-approve
