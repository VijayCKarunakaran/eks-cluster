# eks-cluster
We will be provisioning the below resources
* A VPC network with public and private subnet
* EKS cluster with autoscaling group for worker nodes


We are making use of  the terraform aws modules aws-vpc for vpc creation and aws-eks for setting up our cluster
After the cluster creation, we will output the cluster details and will use the kubeconfig file for accessing the cluster and deploying applications to the cluster later.


**Backend.tf**
=======
Defines the backend s3 storage bucket for storing the terraform state. In this case, we are using an already existing s3 bucket

vpc.tf
=======
We are using the aws vpc module for the vpc creation.
We will define the below inside the file
* Name for VPC 
* The CIDR range.
* Public and private subnets
* Availabilty zones
* Enable NAT gateway, single NAT gateway and dns hostname for the worker nodes
* Adding tags to the private and public subnets

eks-cluster.tf
==========
Will be using the aws eks module for the eks cluster creation
Here we will define the EKS cluster to be created inside the VPC we will be creating and the worker nodes inside the public subnet in our VPC
Will be adding the worker group details as well here, such as the name, security groups to attach to the ASG, number of worker nodes etc


Outputs.tf
=========
Here we will be printing the kubeconfig file for the cluster, which we can use to deploy additional stuff to our cluster


Kubernetes.tf
==============
We are importing the kubernetes provider and define the cluster details for authenticating & connecting to the cluster


