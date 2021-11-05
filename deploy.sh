docker build -t dibzjr/multi-client:latest -t dibzjr/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t dibzjr/multi-server:latest -t dibzjr/multi-server:$SHA  -f ./server/Dockerfile ./server
docker build -t dibzjr/multi-worker:latest -t dibzjr/multi-worker:$SHA  -f ./worker/Dockerfile ./worker

docker push dibzjr/multi-client:latest
docker push dibzjr/multi-server:latest
docker push dibzjr/multi-worker:latest

docker push dibzjr/multi-client:$SHA
docker push dibzjr/multi-server:$SHA
docker push dibzjr/multi-worker:$SHA

kubectl apply -f k8s/

kubectl set image deployments/server-deployment server=dibzjr/multi-server:$SHA
kubectl set image deployments/client-deployment client=dibzjr/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=dibzjr/multi-worker:$SHA




