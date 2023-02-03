COMP =		./srcs/docker-compose.yml
COMUP =		up --build -d
COMDOWN =	down

all:
	@docker compose -f $(COMP) $(COMUP)

down:
	@docker compose -f $(COMP) $(COMDOWN)

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

re: clean all

cache:
	docker system prune -a

.PHONY: all down clean re cache