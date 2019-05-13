#!/bin/bash
terraform remote config \
-backend=s3 \
-backend-config="bucket=dev-gettingstarted-terraform" \
-backend-config="key=terraform.tfstate" \
-backend-config="region=us-east-1" \
-backend-config="encrypt=true"
