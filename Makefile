## Builds the docker image.
.PHONY: docker/build
docker/build:
	docker build --tag quicknode-interview-homework .

## Runs the docker image previously built, listens on port 1234.
.PHONY: docker/run
docker/run:
	docker run -it --rm -p 8080:8080 quicknode-interview-homework

## Uses podman to deploy the deployment.yaml.
.PHONY: podman/deploy
podman/deploy:
	podman play kube ./deployment.yaml

## Uses podman to destroy the deployment.yaml.
.PHONY: podman/destroy
podman/destroy:
	podman play kube ./deployment.yaml --down
