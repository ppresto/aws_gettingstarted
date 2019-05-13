#!/bin/bash
#DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Source in AWS credentials (AWS_ACCESS_KEY, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION)
#ppresto admin
echo "sourcing ${DIRECTORY}/.credentials"
 source ${DIRECTORY}/.credentials

echo "Loading functions: ( aws , startawscli )"
# Create aws CLI function/alias that uses my awscli container to execute commands
aws() {
  docker run \
  --env AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY} \
  --env AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  --env AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} \
  -v $PWD:/data \
  --rm ppresto/awscli aws "$@"
}

# Start container for dev.
startawscli() {
  docker run -it \
  --env AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY} \
  --env AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  --env AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} \
  -v $PWD:/data \
  -v $HOME/:/root \
  --rm ppresto/awscli bash
}
