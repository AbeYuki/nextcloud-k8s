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

## Configure ingress annotations

```
annotations:
  nginx.ingress.kubernetes.io/proxy-body-size: 4G
  nginx.ingress.kubernetes.io/server-snippet: |-
    server_tokens off;
    proxy_hide_header X-Powered-By;
    rewrite ^/.well-known/webfinger /index.php/.well-known/webfinger last;
    rewrite ^/.well-known/nodeinfo /index.php/.well-known/nodeinfo last;
    rewrite ^/.well-known/host-meta /public.php?service=host-meta last;
    rewrite ^/.well-known/host-meta.json /public.php?service=host-meta-json;
    location = /.well-known/carddav {
      return 301 $scheme://$host/remote.php/dav;
    }
    location = /.well-known/caldav {
      return 301 $scheme://$host/remote.php/dav;
    }
    location = /robots.txt {
      allow all;
      log_not_found off;
      access_log off;
    }
    location ~ ^/(?:build|tests|config|lib|3rdparty|templates|data)/ {
      deny all;
    }
    location ~ ^/(?:autotest|occ|issue|indie|db_|console) {
      deny all;
    }
```