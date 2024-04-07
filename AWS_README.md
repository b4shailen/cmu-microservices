## Quickstart (Amazon EKS)

**Ensure you have the following requirements:**

* AWS account with appropriate permissions. 
* Shell environment with AWS CLI (configured with credentials), git, and kubectl.

**Clone the repository:**

```
git clone https://github.com/GoogleCloudPlatform/microservices-demo
cd microservices-demo/
```

**Set up AWS EKS:**

1. **Create an EKS cluster:** You can use the AWS Management Console or the AWS CLI to create an EKS cluster.  Here's an example using the AWS CLI (replace `<cluster-name>` and `<region>` with your desired values):

```
aws eks create-cluster \
    --name <cluster-name> \
    --region <region>
```

2. **Get cluster credentials:** After the cluster creation is complete, use the AWS CLI to retrieve the cluster configuration:

```
aws eks update-kubeconfig --name <cluster-name>
```

This will configure your `kubeconfig` file to interact with the EKS cluster.

**Deploy Online Boutique to the cluster:**

1. **Deploy Kubernetes resources:** The provided YAML file (`./release/kubernetes-manifests.yaml`) should work on EKS with minimal changes. Apply the manifest using kubectl:

```
kubectl apply -f ./release/kubernetes-manifests.yaml
```

2. **Wait for pods to be ready:** Verify that the pods associated with the deployment are running:

```
kubectl get pods
```

After a few minutes, you should see the Pods in a Running state.

**Access the web frontend:**

1. **Get the service endpoint:** Use kubectl to get the external IP address of the `frontend-external` service:

```
kubectl get service frontend-external | awk '{print $4}'
```

2. **Access the application:** Visit `http://<EXTERNAL_IP>` in a web browser to access your instance of Online Boutique.

**Congratulations!** You've deployed the Online Boutique application on Amazon EKS.

**Cleaning Up:**

* To delete the EKS cluster, use the AWS CLI:

```
aws eks delete-cluster --name <cluster-name> --region <region>
```

**Note:** This is a high-level overview of migrating the instructions from GKE to EKS. There might be additional configuration required depending on your specific environment. 