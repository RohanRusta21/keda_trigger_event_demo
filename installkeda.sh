#!/bin/bash

# Add KEDA Helm repository and update
helm repo add kedacore https://kedacore.github.io/charts
helm repo update

# Create namespace for KEDA and install KEDA
kubectl create ns keda
helm install keda kedacore/keda --namespace keda

# Add Kafka Helm repository and update
helm repo add strimzi https://strimzi.io/charts/
helm repo update

# Install kafka operator
helm install strimzi-kafka-operator strimzi/strimzi-kafka-operator
