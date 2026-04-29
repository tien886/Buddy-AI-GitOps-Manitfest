.PHONY: up server-processing restart

IMAGE_TAG = ghcr.io/tien886/buddyai:latest
COMPOSE_FILE = docker-compose-prod.yml
ENV_FILE = buddyai.env

server-processing:
	@echo ">> Stopping server..."
	podman compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) down

	@echo ">> Pulling BuddyAI image: $(IMAGE_TAG)"
	podman pull $(IMAGE_TAG)

	@echo ">> Pulling Neo4j image..."
	podman pull docker.io/library/neo4j:5.26-community

up: server-processing
	@echo ">> Starting BuddyAI..."
	IMAGE_TAG=$(IMAGE_TAG) podman compose \
		-f $(COMPOSE_FILE) \
		--env-file $(ENV_FILE) \
		up -d --force-recreate

restart:
	@echo ">> Restarting BuddyAI..."
	podman restart buddyai-rag
	podman restart buddyai-rag
