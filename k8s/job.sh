#!/bin/bash

NS=$1

kubectl create namespace $NS
kubectl create -f app1-controller.yaml --namespace=$NS --validate=false
kubectl create -f app1-service.yaml --namespace=$NS --validate=false

echo "Waiting for service and pods to come up"
NUM_PODS=$(kubectl get event --namespace=$NS | grep -c "Started container")
echo "Pods Created: $NUM_PODS"

while [ $NUM_PODS != 2 ]; do
  sleep 1
  echo "Pods Created: $NUM_PODS"
  NUM_PODS=$(kubectl get event --namespace=$NS | grep -c "Started container")
done

kubectl get pods --namespace=$NS
kubectl get svc --namespace=$NS
