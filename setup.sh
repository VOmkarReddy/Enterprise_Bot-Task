#!/usr/bin/env bash

set -e

CLUSTER_NAME="demo"
NAMESPACE="demo"
RELEASE_NAME="demo"
IMAGE="demo-app:1.0.0"


command -v docker >/dev/null 2>&1 || { echo "docker is required"; exit 1; }
command -v kind >/dev/null 2>&1 || { echo "kind is required"; exit 1; }
command -v kubectl >/dev/null 2>&1 || { echo "kubectl is required"; exit 1; }
command -v helm >/dev/null 2>&1 || { echo "helm is required"; exit 1; }


if kind get clusters | grep -q "^${CLUSTER_NAME}$"; then
    echo "Kind cluster '${CLUSTER_NAME}' already exists."
else
    echo "Creating kind cluster '${CLUSTER_NAME}'..."
    kind create cluster --name "${CLUSTER_NAME}"
fi

kubectl config use-context "kind-${CLUSTER_NAME}" >/dev/null


echo "Installing ingress-nginx..."

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx >/dev/null 2>&1 || true
helm repo update >/dev/null

helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
    --namespace ingress-nginx \
    --create-namespace \
    --wait


echo "Building application image..."
docker build -t "${IMAGE}" ./service


echo "Loading image into kind..."
kind load docker-image "${IMAGE}" --name "${CLUSTER_NAME}"

echo "Installing application..."

helm upgrade --install "${RELEASE_NAME}" ./chart \
    --namespace "${NAMESPACE}" \
    --create-namespace \
    --wait

echo
echo "Setup completed successfully."
echo
kubectl get pods -n "${NAMESPACE}"