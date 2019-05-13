# AWS CLI Docker Container
[![GitHub forks](https://img.shields.io/github/forks/ppresto/aws_gettingstarted.svg)](https://github.com/ppresto/aws_gettingstarted/network)
[![GitHub stars](https://img.shields.io/github/stars/ppresto/aws_gettingstarted.svg)](https://github.com/ppresto/aws_gettingstarted/stargazers)
[![Docker Pulls](https://img.shields.io/docker/pulls/ppresto/awscli.svg)](https://hub.docker.com/r/ppresto/awscli)
[![Docker Stars](https://img.shields.io/docker/stars/ppresto/awscli.svg)](https://hub.docker.com/r/ppresto/awscli)

# Description
Lite Docker container with the AWS CLI installed and alias/function making aws commands seemless from your command line.

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [AWS CLI Docker Container](#aws-cli-docker-container)
- [Description](#description)
- [Build](#build)
	- [Getting your AWS Keys:](#getting-your-aws-keys)
	- [Configure your AWS credentials in your shell](#configure-your-aws-credentials-in-your-shell)
- [Setup AWS account](#setup-aws-account)
	- [You can run any commands available to the AWS CLI](#you-can-run-any-commands-available-to-the-aws-cli)
	- [Example Usage:](#example-usage)
		- [Describe an instance:](#describe-an-instance)
		- [Return a list of items in s3 bucket](#return-a-list-of-items-in-s3-bucket)
		- [Upload content of your current directory to s3 bucket](#upload-content-of-your-current-directory-to-s3-bucket)
	- [Example Container Usage without aws function](#example-container-usage-without-aws-function)
		- [Retrieve a decrypted Windows password by passing in your private key](#retrieve-a-decrypted-windows-password-by-passing-in-your-private-key)
	- [Example Usage with Docker Compose:](#example-usage-with-docker-compose)

<!-- /TOC -->
# Components
Lite Docker container with the AWS CLI installed and alias/function making aws commands seemless.

* Using [Alpine linux](https://hub.docker.com/_/alpine/).
* aws-cli/1.16.138
* Python/2.7.15

# Build
Clone this repo and build your aws image using your docker id if you want to push it to your dockerhub account
```
git clone https://github.com/ppresto/aws_gettingstarted.git
cd aws_gettingstarted/awscli
docker build -t ppresto/awscli .
```

## Getting your AWS Keys:

[http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html#cli-signup](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html#cli-signup)

## Configure your AWS credentials in your shell
vi .credentials
```
# Setup AWS account
AWS_ACCESS_KEY=<INPUT ACCESS KEY HERE>
AWS_SECRET_ACCESS_KEY=<INPUT SECRETS KEY HERE>
AWS_DEFAULT_REGION=<INPUT REGION HERE
```
Load the "aws" function that will work exactly like the normal aws command but instead of running from the OS it will run within your container with your credentials setup.

```
source setEnv.sh
```
Note: this function will attempt to mount your cwd to /data if you want to sync files.

## You can run any commands available to the AWS CLI
[http://docs.aws.amazon.com/cli/latest/index.html](http://docs.aws.amazon.com/cli/latest/index.html)

## Example Usage:

### Describe an instance:
aws ec2 describe-instances

### Return a list of items in s3 bucket
aws s3 ls

### Upload content of your current directory to s3 bucket
aws s3 sync . s3://mybucket




## Example Container Usage without aws function

### Retrieve a decrypted Windows password by passing in your private key
We will map the private keys that resides on your local system to inside the container

    docker run \
    -v <<LOCATION_TO_YOUR_PRIVATE_KEYy>>:/tmp/key.pem \
    --env AWS_ACCESS_KEY_ID=<<YOUR_ACCESS_KEY>> \
    --env AWS_SECRET_ACCESS_KEY=<<YOUR_SECRET_ACCESS>> \
    --env AWS_DEFAULT_REGION=us-east-1 \
    garland/aws-cli-docker \
    aws ec2 get-password-data --instance-id  <<YOUR_INSTANCE_ID>> --priv-launch-key /tmp/key.pem

Output:

    {
        "InstanceId": "i-90949d7a",
        "Timestamp": "2014-12-11T01:18:27.000Z",
        "PasswordData": "8pa%o?foo"
    }

doc: http://docs.aws.amazon.com/cli/latest/reference/ec2/get-password-data.html

## Example Usage with Docker Compose:

    echo AWS_ACCESS_KEY_ID=ID >> .env
    echo AWS_SECRET_ACCESS_KEY=KEY >> .env
    docker-compose run aws s3 ls

Thank you Sekka1 for a lightweight solution!
https://github.com/sekka1/aws-cli-docker
