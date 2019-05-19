#!/bin/bash
set -v
set -e

gcloud compute disks delete kube-test
gcloud compute disks create --size=1GiB --zone=us-central1-a kube-test || true

gcloud beta container clusters create my-cluster --addons=Istio,HorizontalPodAutoscaling,HttpLoadBalancing --istio-config=auth=MTLS_STRICT --cluster-version=latest --machine-type=n1-standard-1 --num-nodes=3 --image-family=cos-stable --enable-stackdriver-kubernetes --enable-ip-alias --enable-autoscaling --min-nodes=0 --max-nodes=4 --enable-autorepair --scopes cloud-platform 

kubectl create clusterrolebinding cluster-admin-binding \
     --clusterrole=cluster-admin \
     --user=$(gcloud config get-value core/account)

kubectl apply --selector knative.dev/crd-install=true \
   --filename https://github.com/knative/serving/releases/download/v0.6.0/serving.yaml \
   --filename https://github.com/knative/build/releases/download/v0.6.0/build.yaml \
   --filename https://github.com/knative/eventing/releases/download/v0.6.0/release.yaml \
   --filename https://github.com/knative/eventing-sources/releases/download/v0.6.0/eventing-sources.yaml \
   --filename https://github.com/knative/serving/releases/download/v0.6.0/monitoring.yaml \
   --filename https://raw.githubusercontent.com/knative/serving/v0.6.0/third_party/config/build/clusterrole.yaml || true

kubectl apply --filename https://github.com/knative/serving/releases/download/v0.6.0/serving.yaml --selector networking.knative.dev/certificate-provider!=cert-manager \
   --filename https://github.com/knative/build/releases/download/v0.6.0/build.yaml \
   --filename https://github.com/knative/eventing/releases/download/v0.6.0/release.yaml \
   --filename https://github.com/knative/eventing-sources/releases/download/v0.6.0/eventing-sources.yaml \
   --filename https://github.com/knative/serving/releases/download/v0.6.0/monitoring.yaml \
   --filename https://raw.githubusercontent.com/knative/serving/v0.6.0/third_party/config/build/clusterrole.yaml

kubectl get pods --namespace knative-serving
kubectl get pods --namespace knative-build
kubectl get pods --namespace knative-eventing
kubectl get pods --namespace knative-sources
kubectl get pods --namespace knative-monitoring
