# Deploy the MCV app
kubectl apply -f  api-deployment.yaml

kubectl apply .f api-service.yaml
#Deploy the DB

kubectl create secret generic mssql --from-literal=SA_PASSWORD="MyC0m9l&xP@ssw0rd"

kubectl apply -f sqldb-storage.yaml

kubectl apply -f sqldb-deployment.yaml
