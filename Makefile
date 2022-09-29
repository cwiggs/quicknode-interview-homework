## Builds the docker image.
.PHONY: docker/build
docker/build:
	docker build --tag quicknode-interview-homework .

## Runs the docker image previously built, listens on port 1234.
.PHONY: docker/run
docker/run:
	docker run -it --rm -p 8080:8080 quicknode-interview-homework

## Uses podman to build/deploy the deployment.yaml.
.PHONY: podman/deploy
podman/deploy:
	podman play kube ./deployment.yaml

## Uses podman to destroy the deployment.yaml.
.PHONY: podman/destroy
podman/destroy:
	podman play kube ./deployment.yaml --down

## Deploys this app to the quicknode server
.PHONY: production/deploy
production/deploy:
	@ssh -i ~/.ssh/quicknode_homework.pem root@198.199.92.18 'apt-get -qq update && apt-get -qqy install podman make'
	@rsync -a '-e ssh -i ~/.ssh/quicknode_homework.pem' ./ root@198.199.92.18:/root/quicknode-interview-homework
	@ssh -i ~/.ssh/quicknode_homework.pem root@198.199.92.18 'rsync -a /root/quicknode-interview-homework/quicknode-interview-homework.service /etc/systemd/system/'
	@ssh -i ~/.ssh/quicknode_homework.pem root@198.199.92.18 'systemctl daemon-reload && systemctl enable quicknode-interview-homework.service --now'
