.PHONY: up

IMAGE_TAG = ghcr.io/tien886/buddyai:latest

up:
	@echo ">> Pulling BuddyAI image..."
	podman pull $(IMAGE_TAG)

	@echo ">> Starting BuddyAI..."
	IMAGE_TAG=$(IMAGE_TAG) podman compose \
		-f docker-compose-prod.yml \
		--env-file buddyai.env \
		up -d