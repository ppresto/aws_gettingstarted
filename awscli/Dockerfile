FROM alpine:3.6

ARG AWS_CLI_VERSION=1.16.138
ENV AWS_CLI_VERSION=$AWS_CLI_VERSION

ARG TERRAFORM_VERSION=0.11.13
ENV TERRAFORM_VERSION=$TERRAFORM_VERSION

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less bash wget unzip ansible openssh-client && \
    pip --no-cache-dir install awscli==${AWS_CLI_VERSION} \
    && mkdir -p /etc/ansible \
    && wget -O /etc/ansible/ansible.cfg --quiet https://raw.githubusercontent.com/ansible/ansible/devel/examples/ansible.cfg \
    && sed -i s/^#host_key_checking/host_key_checking/g /etc/ansible/ansible.cfg \
    && rm -rf /var/cache/apk/*

RUN wget --quiet https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && mv terraform /usr/local/bin \
  && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Get latest
# RUN pip install --upgrade pip awscli

WORKDIR /data
