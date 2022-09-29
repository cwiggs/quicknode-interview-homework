# quicknode-interview-homework
This is the homework assignment for quicknode interview.

This repo uses [pre-commit](https://pre-commit.com/) to manage pre-commit hooks.

## Deployment
This repo has a `deployment.yaml` that can be used with podman to deploy a pod with 1 replica, or deploy using kubernetes.

The nice thing about using podman is that you can easily make changes in dev on a local system, but if you want to scale out
you can use the same manifest to deploy to k8s as well.

This app is deployed to production via `make production/deploy`, that target:

1. Installs dependencies (podman, make).
2. Copies this repo to the remote server.
3. Enables the systemd service so that the podman deployment will withstand restarts, crashes, etc.

## Make
There is a Makefile to help automate local development and deployment to the server via ssh.
run `cat Makefile` to see all the targets and a description for them.
