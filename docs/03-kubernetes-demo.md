# Kubernetes demo

## Creating a cluster

gcloud beta container clusters create hello-world-cluster --machine-type=n1-standard-2 --num-nodes=4 --cluster-version=latest --addons=Istio --istio-config=auth=MTLS_STRICT

## Creating a pod

## Request forwarding

`kubectl port-forward <pod_name> <localPort>:<containerPort>`

## ReplicaSet

ReplicaSets try to ensure that the specified number of replicas stay up. They do that with the help of labels.

## Labels

Labels are ways to group pods. For instance, we can assign a production pod labels like: app: hello and env: prod
ReplicaSets use selectors which match labels with the pods. You can also attach labels on nodes. This way, if your
pod depends on a specific hardware or configuration, using nodeSelector, you can ensure that it gets allocated
only such nodes. Labels can be altered at runtime too.

## Daemonset

DaemonSets are similar to ReplicaSets but they ensure that one instance of a pod runs on all the nodes. You can limit the nodes by specifying the nodeSelector.

## Job

Jobs are helpful if you want the container to run and finish. In case, the job fails or the node fails, Kubernetes can schedule that job on another node. You can also run multiple instances of the job in sequence or in parallel.

## CronJob

CronJobs are similar to Jobs but here you can also specify a cron schedule.

## Services

Services map port to another port. It provides a way to provide a single interface for accessing a cluster. It is of three types:
 * ClusterIP
 * NodePort
 * LoadBalancer

Volumes:
 * Each container can manage its own file system and not others'
 * Non-persistent and persistent storage

Deployments:
 * Show rolling updates
 * Show recreate strategy of deleting existing pods and spawning new ones
