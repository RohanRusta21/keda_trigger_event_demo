#!/bin/bash

helm repo add kedacore https://kedacore.github.io/charts
helm repo update
kubectl create ns keda
helm install keda kedacore/keda --namespace keda
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl create ns monitoring
helm install prometheus prometheus-community/prometheus -n monitoring
