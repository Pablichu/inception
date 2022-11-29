SRCS =		srcs/
COMUP =		docker compose up --build -d
COMDOWN =	docker compose down

all:
	$(MAKE) -C $(SRCS) $(COMUP)

destroy:
	$(MAKE) -C $(SRCS) $(COMDOWN)
