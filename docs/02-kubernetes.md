# Kubernetes

Kubernetes can perform several functions like:
  * Container management across nodes
  * Getting a load-balancer provisioned from the cloud provider for a given set of pods
  * Rolling deployments
  * Secret management
  * Volume provisioning
  * Service Discovery
  * Running Jobs

## Terminology:  
  * ### Node
    Nodes refers to the bare-metal or VMs which make up the Kubernetes cluster.

  * ### Pod  
    Pod is a set of containers which are always co-located i.e. they are always present together on the same node. Also, they share all the namespaces: Linux namespaces as well as Kubernetes namespaces. So, they can communicate directly between themselves.

  * ### Namespace  
    If two Kubernetes objects have the same name, they can be disambiguated by using namespaces. By default, the objects are created in the "default" namespace.

  * ### Replicaset  
    Replicaset ensure that a certain number of the pods which they manage stay up. If a pod becomes unhealthy, the replicasets take care of terminating the pod and creating a new one.

  * ### Service  
    Services basically map an incoming port to a target port. They can be used to expose multiple pods as a cluster via a LoadBalancer.


