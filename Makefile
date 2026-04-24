.PHONY: up

IMAGE_TAG = ghcr.io/tien886/buddyai:latest

pull-backend:
	@echo ">> Pulling backend image: $(IMAGE_TAG)"
	podman pull $(IMAGE_TAG)

up: pull-backend
	@echo ">> Starting stack with image: $(IMAGE_TAG)"
	IMAGE_TAG=$(IMAGE_TAG) podman-compose \
		-f docker-compose-prod.yml \
		--env-file backend.env \
		up -d