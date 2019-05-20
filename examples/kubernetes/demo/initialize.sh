#!/bin/bash
set -v
set -e

if [ "$1" == "" ]; then
  echo "Please provide the cluster name"
  exit 1
else
  echo "cluster name: $1"
fi  

gcloud compute disks delete kube-test --quiet || true
gcloud compute disks create --size=1GiB --zone=us-central1-a kube-test || true

gcloud beta container clusters create "$1" --addons=Istio,HorizontalPodAutoscaling,HttpLoadBalancing --istio-config=auth=MTLS_STRICT --cluster-version=latest --machine-type=n1-standard-2 --num-nodes=3 --image-family=cos-stable --enable-stackdriver-kubernetes --enable-ip-alias --enable-autoscaling --min-nodes=1 --max-nodes=3 --enable-autorepair --scopes cloud-platform 

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

kubectl label namespace default istio-injection=enabled

kubectl get pods --namespace knative-serving
kubectl get pods --namespace knative-build
kubectl get pods --namespace knative-eventing
kubectl get pods --namespace knative-sources
kubectl get pods --namespace knative-monitoring

# Install Prometheus

curl https://storage.googleapis.com/gke-release/istio/release/1.0.3-gke.3/patches/install-prometheus.yaml | kubectl apply -n istio-system -f -

# Install Grafana
curl https://storage.googleapis.com/gke-release/istio/release/1.0.3-gke.3/patches/install-grafana.yaml | kubectl apply -n istio-system -f -

# Install Service Graph
curl https://storage.googleapis.com/gke-release/istio/release/1.0.3-gke.3/patches/install-servicegraph.yaml | kubectl apply -n istio-system -f -

# Install Jaeger (tracing)
curl https://storage.googleapis.com/gke-release/istio/release/1.0.3-gke.3/patches/install-tracing.yaml | kubectl apply -n istio-system -f -

kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller

helm init --service-account tiller
