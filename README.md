# nextcloud-k8s

## Quick Start
```
minikube start --cpus="3" --memory="5g"
```

```
cd nextcloud-k8s/overlay/testing/
```

```
kubectl apply -f namespace.yaml
```

```
kubectl apply -k ./
```

```
kubectl port-forward -n nextcloud-testing service/nextcloud-app-testing 8080:80
```