.PHONY: up

IMAGE_TAG = ghcr.io/tien886/buddyai:latest

pull-image:
	@echo ">> Pulling BuddyAI image: $(IMAGE_TAG)"
	podman pull $(IMAGE_TAG)

	@echo ">> Pulling Neo4j image..."
	podman pull docker.io/library/neo4j:5.26-community

up: pull-image
	@echo ">> Starting BuddyAI..."
	IMAGE_TAG=$(IMAGE_TAG) podman compose \
		-f docker-compose-prod.yml \
		--env-file buddyai.env \
		up -d
