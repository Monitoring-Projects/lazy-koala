TAG=$(date +%s)

docker build . -t ghcr.io/Monitoring-Projects/lazy-koala/gazer:"$TAG"
minikube image load ghcr.io/Monitoring-Projects/lazy-koala/gazer:"$TAG"
kubectl set image daemonsets.apps gazer gazer=ghcr.io/Monitoring-Projects/lazy-koala/gazer:"$TAG" -n lazy-koala
kubectl scale --replicas 0 deployment prometheus -n lazy-koala
sleep 1
kubectl scale --replicas 1 deployment prometheus -n lazy-koala
