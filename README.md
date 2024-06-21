# keda_trigger_demo 

What is KEDA?

KEDA is a Kubernetes-based Event Driven Autoscaler. With KEDA, we can drive the scaling of any container in Kubernetes based on the number of events needing to be processed. KEDA handles the triggers to respond to events that occur in other services and scales workloads as needed.

KEDA is a single-purpose and lightweight component that can be added to any Kubernetes cluster. KEDA works alongside standard Kubernetes components like the Horizontal Pod Autoscaler and can extend functionality without overwriting or duplication. With KEDA we can explicitly map the apps we want to scale, with other apps continuing to function. This makes KEDA a flexible and safe option to run alongside any Kubernetes applications or frameworks.
Scaler

KEDA has a wide range of scalers that can detect if a deployment should be activated or deactivated, and feed custom metrics for a specific event source.
ScaledObject

ScaledObject is deployed as a Kubernetes CRD (Custom Resource Definition) which is used to define how KEDA should scale our application and what triggers to use.


### Install KEDA using kubectl

```shell
kubectl apply --server-side -f https://github.com/kedacore/keda/releases/download/v2.14.0/keda-2.14.0.yaml
```

### Installing using Helm

```shell
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
helm install keda kedacore/keda --namespace keda --create-namespace
```

### Validate if Installation is successful or not

```shell
kubectl get deploy,crd -n keda
```

### Verify Scaled Objects Created or not

```shell
kubectl get scaledobjects
```

### Checking logs for keda operator

```shell
kubectl logs -f keda-operator-6c99649b58-r5qtl -n keda --tail=100
```


### Installing KEDA HTTP Add-on

```shell
helm install http-add-on kedacore/keda-add-ons-http --namespace keda
```

### For autoscaling to work properly, HTTP traffic needs to route through the Service that the add-on has set up.

```shell
kubectl port-forward svc/keda-add-ons-http-interceptor-proxy -n keda 32500:8080
```

### Send http based traffic to host and service

```shell
curl localhost:32500 -H 'Host: myhost.com'
```
