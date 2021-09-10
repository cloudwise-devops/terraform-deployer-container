FROM centos:7
ENV GOOGLE_APPLICATION_CREDENTIALS=/root/sa.json
ENV GCE_PROJECT=dummy
ENV HELM_DIR="/usr/bin"
ENV HELM_BIN="/usr/bin/helm"
ENV HELM_VERSION="v3.6.3"
ENV SOPS_VERSION="3.7.1"
ENV HELM_GCS_VERSION="0.2.1"
ENV KUBEDOG_VERSION="v0.5.1"
COPY google-sdk.repo /etc/yum/repos.d/google-sdk.repo
RUN yum update -y && yum install epel-release wget git -y
RUN wget https://storage.yandexcloud.net/kubedog/targets/releases/${KUBEDOG_VERSION}/kubedog-linux-amd64-${KUBEDOG_VERSION} -O /usr/bin/kubedog && \
yum install kubectl google-cloud-sdk https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}-1.x86_64.rpm -y && \
wget https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O /tmp/helm.tar.gz && \
tar -zxvf /tmp/helm.tar.gz -C /usr/bin/ --strip-components=1 && \
chmod +x /usr/bin/* && \
rm -rf /tmp/helm.tar.gz && \
helm plugin install https://github.com/hayorov/helm-gcs
RUN curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash
RUN yum clean all && rm -rf /var/yum/cache