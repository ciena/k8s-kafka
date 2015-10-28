start:
	docker-compose up -d

stop:
	docker-compose stop

clean:
	docker-compose rm
	docker ps -a | awk '{print $1}' | xargs docker kill

p:
	kubectl get pods

n:
	kubectl get nodes

rc:
	kubectl get rc

srv:
	kubectl get services

ps:
	docker ps

kafkarc:
	kubectl create -f kafka-rc.yaml

kafkaip:
	kubectl describe pod kafka | grep IP | sed -E 's/IP:[[:space:]]+//'

delkafkarc:
	kubectl delete -f kafka-rc.yaml

kafkasrv:
	kubectl create -f kafka-service.yaml

delkafkasrv:
	kubectl delete -f kafka-service.yaml

zkrc:
	kubectl create -f zk-rc.yaml

zkip:
	kubectl describe pod zk | grep IP | sed -E 's/IP:[[:space:]]+//'

delzkrc:
	kubectl delete -f zk-rc.yaml

zksrv:
	kubectl create -f zk-service.yaml

delzksrv:
	kubectl delete -f zk-service.yaml


kafkashell:
	echo "start-kafka-shell.sh <DOCKER_HOST_IP> <ZK_HOST:ZK_PORT>"

scale:
	kubectl scale rc kafka --replicas=$(COUNT)
