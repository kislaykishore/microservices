# Container

## Why containerize?

The objective of containerization is to run software reliably and ensuring portability across different operating systems. This basically boils down to:
 * Making the containers self-contained units of execution. You bundle the environment along with the executable.
 * Isolating them from other containers so that they don't depend upon anything else. In fact, processes within a container don't even know if there are other processes or containers running outside their own containers.
 * The ability to limit their resource utilization. For instance, we can specify the maximum cpu or memory a container can use. 
 * Less overhead than VMs. In fact, you can run hundreds (or thousands) of containers on a single machine, thanks to the Copy-on-write paradigm.

## Can a container created on Linux run on Windows?

No, the containers still depend upon the kernel. So, a container compiled on Ubuntu can be run on Fedora given that both share the same Linux kernel, but it cannot run on Windows.

## What is a kernel?

Kernel is a part of operating system which is close to the hardware. It provides access to system resources like CPU, networking, memory etc.

## How is kernel different from operating system?

Kernel is a part of operating system. An operating system consists of a Kernel and various applications and services built on top of it. For instance, Ubuntu is an operating system built on top of the Linux kernel. It provides things like a UI and has got a certain set of applications pre-installed, like bash.

## How is it relevant to container

Containers target the kernel instead of an operating system. So, a container image which can run on Ubuntu can run on Fedora or Arch Linux since all of them share the same kernel: the Linux kernel

## What are container images?

Container images consist of an application along with its dependencies. Apart from the packaged dependencies, they are only expected to depend upon the kernel. So, they are pretty much self-contained.

# Features of the Linux kernel which enable containerization

## Control Groups

Control Groups or cgroups is a Linux feature which allows one to limit the resource usage of a collection/group of processes.

## Namespaces

Linux provides a feature called namespaces which allows us to present a different view of kernel resources to different sets of processes. Consider the PID namespace for instance. In a custom PID namespace, the first process is assigned a PID of 1. Any process, which becomes orphan, is made a child of that process and when that process dies, all the child process die.
Another example is the UTS namespace which allows setting different hostnames and domain names for different namespaces.
Similarly, in case of network namespaces, each namespace has a private set of IP addresses, routing table etc.

## What is Docker?

Docker is a container runtime engine. It takes an image as input and runs it. The running process is called a container. Docker utilizes the cgroup and namespaces features to isolate the processes running within a container and limit their resources. The isolation implies that one container cannot see another container running on the same physical host and limiting the resources implies that the required amount of CPUs and memory can be reserved for a container. This helps in making the performance more or less consistent across different systems. Please note that by default, there is no restriction imposed on the amount of memory a container can use. Docker can impose a hard limit on memory, or a soft one where it allows the container to use as much memory as needed unless certain conditions are met, such as if kernel detects low available memory.


## Virtualization

Virtualization is of two types:
 * Type-I -- In this type of virtualization, the hypervisor runs directly on the bare metal.
 * Type-II -- The hypervisor runs on top of an OS e.g. VMware, VirtualBox

Benefits of Virtualization:
  * Virtualization helps in a better utilization of a machine by allowing multiple OSes to be run on top of it
  * It also provides isolation between the different VMs

## Containers vs VMs

| VM | Containers |
| --- | --- |
|![VM](https://github.com/kislaykishore/microservices/blob/master/images/vms.png)|![Containers](https://github.com/kislaykishore/microservices/blob/master/images/containers.png)|

## Creating a Docker image

Refer this wiki for creating a "Hello, World" image [Python Hello-World](../examples/hello-world-python/README.md)

## Related Concepts

  * ### Distroless  
    Generally, the base images of the image that we use contain some or the other operating system as the base image. Although, the operating system image is a stripped down version of the actual OS in that it doesn't have the kernel, but it basically means that you still are installing a full fleged operating system in the container. The more the number of softwares installed, more are the number of security risks. So, folks in Google came up with a concept of Distroless base images. These images don't contain any operating system. Instead, they provide language specific runtimes. For instance, they have an image targeting Java11. Such images help in reducing the surface area for security attacks. However, the problem here is that you don't have much say. If you are using a Java11 distroless image and you want to upgrade to Java12, you need to wait for a distroless image to become available. Another problem is that, since you don't have any operating system, the basic tools like bash are not available. So, you cannot just execute a /bin/bash shell to gain access. But again, this limitation comes with security benefits.
  * ### Unikernel
    When an application makes a system call, say to read data, there is a cost involved in copying the data from the kernel-space to the user-space. Unikernel aims to avoid this cost by having a single address space. This technology is promising from the performance standpoint, but it is currently not mature enough. As a matter of fact, the current implementations of unikernel are so unoptimized that they underperform when compared to their container counterparts.
