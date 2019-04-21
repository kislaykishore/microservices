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
    Types of Services:
    * #### ClusterIP  
      ClusterIP exposes the service locally. It doesn't generate an external IP. The pods are accessible within the cluster.

    * #### NodePort  
      NodePort reserves the same port on all the nodes irrespective of the fact that the node contains the pod. Any traffic coming through that port will be redirected to a node which has the pod running.

    * #### LoadBalancer  
      Assume that we have given the IP address of one of the nodes to external users and they use it to invoke the services and that node crashes. So, the calls won't work. A loadbalancer ensures that the traffic gets routed only to healthy nodes.


  * ### Endpoints  
    Services are backed by the Endpoints resource. Endpoints specifies the endpoints/ip:port combinations to which the service should redirect the incoming request to. If Services are created without specifying a pod selector, then the corresponding EndPoints resource doesn't get auto-generated. We can then create our own Endpoints resource which we can use to proxy the request to a different location of our choosing.

    Alternatively, one can configure the Service to be of type: ExternalName and specify the spec.externalName property to the target endpoint.


    


