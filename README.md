# terraform-deployer-container-gcloud
Custom deployer Image based on Centos7 with for google cloud/GKE deployments. All you need for perfect GCP deployer image
- git
- gcloud-api utils
- kubectl
- helm
- helm gcs plugin
- flant kubedog
- infracost
- sops
- tswicher
- netcat

Bad/Ugly things:
- Runs as root
- Versions for components not being updated automatically