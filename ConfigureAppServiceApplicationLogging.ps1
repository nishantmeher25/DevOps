gitRepo=https://github.com/MicrosoftDocs/mslearn-capture-application-logs-app-service
appName="contosofashions$RANDOM"
appPlan="contosofashionsAppPlan"
appLocation="EastUS"
resourceGroup=learn-c0c2f0a9-9566-4b8a-8bcf-1e824d2aa4d6
storageAccount=sa$appName

#app service creation
az appservice plan create --name $appPlan --resource-group $resourceGroup --location $appLocation --sku FREE
az webapp create --name $appName --resource-group $resourceGroup --plan $appPlan --deployment-source-url $gitRepo
az storage account create -n $storageAccount -g $resourceGroup -l $appLocation --sku Standard_LRS

#log stream Azure CLI
# az webapp log tail --name \<_app name_\> --resource-group \<_resource group name_\>
az webapp log tail --name contosofashions10864 --resource-group learn-c0c2f0a9-9566-4b8a-8bcf-1e824d2aa4d6

#curl 
#curl -u {username} https://{sitename}.scm.azurewebsites.net/api/logstream
curl -u nmeher https://contosofashions10864.scm.azurewebsites.net/api/logstream

#download log files
# az webapp log download --log-file \<_filename_\>.zip  --resource-group \<_resource group name_\> --name \<_app name_\>
az webapp log download --log-file \<_filename_\>.zip  --resource-group \<_resource group name_\> --name \<_app name_\>










