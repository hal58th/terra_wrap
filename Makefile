run docker:
	DOCKER_BUILDKIT=1 docker build -t terraform:latest docker
	@touch .docker_ash_history
	@echo "DROPPING INTO DOCKER CONTAINER..."
	@docker run -it \
		-v ~/.aws:/root/.aws \
		-v $$(pwd):/terraform \
		-v $$(pwd)/.docker_ash_history:/root/.ash_history \
		terraform:latest

# Format all terraform files recursively. This is a safe command as it will just fix the formatting.
fmt format:
	terraform fmt -recursive -diff
