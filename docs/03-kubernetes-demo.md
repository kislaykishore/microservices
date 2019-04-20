# Kubernetes demo

## Creating a cluster

gcloud beta container clusters create hello-world-cluster --machine-type=n1-standard-2 --num-nodes=4 --cluster-version=latest --addons=Istio --istio-config=auth=MTLS_STRICT

## Creating a pod

## Request forwarding

`kubectl port-forward <pod_name> <localPort>:<containerPort>`

## ReplicaSet

ReplicaSets try to ensure that the specified number of replicas stay up.

## Labels

Labels are ways to group pods. For instance, we can assign a production pod labels like: app: hello and env: prod
ReplicaSets use selectors which match labels with the pods. You can also attach labels on nodes. This way, if your
pod depends on a specific hardware or configuration, using nodeSelector, you can ensure that it gets allocated
only such nodes
