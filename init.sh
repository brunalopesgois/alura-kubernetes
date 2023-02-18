#!/bin/sh

kind create cluster --config kind-config.yaml

kubectl apply -f ./portal-configmap.yaml
kubectl apply -f ./sistema-configmap.yaml
kubectl apply -f ./db-configmap.yaml

kubectl apply -f ./svc-portal-noticias.yaml
kubectl apply -f ./svc-sistema-noticias.yaml
kubectl apply -f ./svc-db-noticias.yaml

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm repo update
helm upgrade --install --set args={--kubelet-insecure-tls} metrics-server metrics-server/metrics-server --namespace kube-system
kubectl apply -f ./portal-noticias-deployment.yaml
kubectl apply -f ./portal-noticias-hpa.yaml

kubectl apply -f ./db-noticias-deployment.yaml

kubectl apply -f ./imagens-pvc.yaml
kubectl apply -f ./sessao-pvc.yaml
kubectl apply -f ./sistema-noticias-statefulset.yaml

sleep 120
gnome-terminal --tab -t "svc-portal-noticias" -- kubectl port-forward svc/svc-portal-noticias 30000:80
sleep 3
gnome-terminal --tab -t "svc-sistema-noticias" -- kubectl port-forward svc/svc-sistema-noticias 30001:80