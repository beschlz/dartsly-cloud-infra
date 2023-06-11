# 🚀 Infrastructure for dartsly.app

In this repo you`ll find the infrastructure code for dartsly.app, just a toy app I would like to build as a side project.

## 🛩 High Level Overview of the dartsly.app infrastructure

The infrastructure is hosted in AWS. dartsly.app uses a k3s cluster, since an EKS Cluster costs about 70$ per month. The cluster is made up of one master and one worker node installed on two EC2 instances. The images of the EC2 instances are build using packer. The infrastructe itself is build using terraform

## ☸️ Why Kubernetes instead of serverless?!

First of all, kubernetes is great! But yes, severless would be a great option for this project. But I wanted to expand my k8s knowledge a bit an try out new tools.

Stuff that i would like to try out with this cluster is:
* A fully GitOps driven workflow on Kubernetes and AWS
* Especially using ArgoCD and using a service mesh (Linkerd or Istio, haven`t setteld there yet)
* Vault for Secrets Management
* Zitadel, i`ve used Keycloak quite a bit and wanted to try an alternative

## 📁 Repo Organization

**/packer**  
Includes everything to setup the EC2 Nodes for a k3s cluster.

**/terraform**  
The terraform code used to provision

## 🛠️ Tools

**Packer**  
Packer is a Tool by Hashicorp to build vm images.

**Terraform**  
Properly *the* infrastructure a code per see


## Docs
