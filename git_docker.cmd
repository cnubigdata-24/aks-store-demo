# clone and build the aks sample code
git clone https://github.com/Azure-Samples/aks-store-demo.git .

docker compose -f docker-compose-quickstart.yml up -d

docker images
docker ps
(navigate to http://localhost:8080)
(해당 포트 사용시 docker-compose-quickstart.yml 파일에서 8080:8080 => 80:8080 등으로 다른 포트로 변경)

docker compose down


# push docker images to the azure conatainer registry
az acr login --name $ACRNAME

docker tag aks_test-product-service:latest $ACRNAME.azurecr.io/aks-store-demo/product-service:latest
docker tag aks_test-order-service:latest $ACRNAME.azurecr.io/aks-store-demo/order-service:latest
docker tag aks_test-store-front:latest $ACRNAME.azurecr.io/aks-store-demo/store-front:latest

docker push $ACRNAME.azurecr.io/aks-store-demo/product-service:latest
docker push $ACRNAME.azurecr.io/aks-store-demo/order-service:latest
docker push $ACRNAME.azurecr.io/aks-store-demo/store-front:latest


