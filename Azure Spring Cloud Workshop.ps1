RESOURCE_GROUP_NAME=spring-cloud-workshop
SPRING_CLOUD_NAME=azure-spring-cloud-workshop

az group create -g "spring-cloud-workshop" -l eastus

az spring-cloud create -g "spring-cloud-workshop" -n "azure-spring-cloud-workshop" --sku standard