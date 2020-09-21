RESOURCE_GROUP_NAME=spring-cloud-workshop
SPRING_CLOUD_NAME=azure-spring-cloud-workshop

az group create -g "spring-cloud-workshop" -l eastus

az spring-cloud create -g "spring-cloud-workshop" -n "azure-spring-cloud-workshop" --sku standard

# PM bac0ab85567fd1b593d33d4515af57e22e0c557d

az spring-cloud app create -n todo-service --resource-group "spring-cloud-workshop" --service "azure-spring-cloud-workshop-nm"

az cosmosdb create --name "azure-spring-cloud-workshop-nm-cosmosdb" --kind MongoDB --resource-group "spring-cloud-workshop"

az cosmosdb mongodb database create --account-name "azure-spring-cloud-workshop-nm-cosmosdb" --name "cosmosdb-todos" --resource-group "spring-cloud-workshop"

curl https://start.spring.io/starter.tgz -d dependencies=web, data-mongodb, cloud-eureka, cloud-config-client -d baseDir=todo-service -d bootVersion=2.2.5.RELEASE | tar -xzvf -

cd todo-service ./mvnw clean package -DskipTests -Pcloud
az spring-cloud app deploy -n todo-service --jar-path target/demo-0.0.1-SNAPSHOT.jar
cd ..

az spring-cloud app deployment create -n green-deployment --app todo-service -s "azure-spring-cloud-workshop-nm" -g "spring-cloud-workshop"
az spring-cloud app deployment create -n green-deployment --app todo-service -s "azure-spring-cloud-workshop-nm" -g "spring-cloud-workshop" --jar-path todo-service.jar --jvm-options="-XX:+UseG1GC -XX:+UseStringDeduplication" --env foo=bar