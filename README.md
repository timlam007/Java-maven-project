CI/CD Pipeline with GitHub Actions

This repository contains the configuration for a CI/CD pipeline using GitHub Actions. The pipeline is designed to build a Java application, package it into a Docker container, scan the Docker image for security vulnerabilities, and then deploy it to an OpenShift cluster.

Workflow
The pipeline consists of the following jobs:

Build: This job checks out the repository, sets up the Java environment, builds the Maven project, and runs the JUnit tests.

Build Container: This job checks out the repository, sets up Docker, logs into the Red Hat Registry, builds a Docker image, and then pushes the image to Quay.io.

Scan Security Vulnerabilities: This job checks out the repository, and then scans the Docker image for security vulnerabilities using Snyk.

Deploy: This job checks out the repository, installs the OpenShift CLI, sets up the OpenShift CLI, and then applies the OpenShift manifests to deploy the application.

Secrets
The following secrets need to be configured in the GitHub repository:

RH_REGISTRY_USERNAME: Your Red Hat Registry username.
RH_REGISTRY_PASSWORD: Your Red Hat Registry password.
SNYK_TOKEN: Your Snyk API token.
Usage
To use this pipeline, you need to have a GitHub repository with a Java application and OpenShift manifests (deployment.yaml, service.yaml, route.yaml).

Fork this repository or copy the content of the .github/workflows/ci-cd.yml file into your repository.
Configure the secrets in your GitHub repository.
Customize the .github/workflows/ci-cd.yml file as per your needs.
Push your changes to the main branch. The pipeline will be triggered on every push to the main branch.


The CI/CD pipeline using this code would involve the following steps:

Checkout Repository: The repository is checked out from the main branch.

Build Maven Project: The Maven project is built using Java 11. The Maven clean install command will build the project and install the package into the local repository.

Run JUnit Tests: JUnit tests are run using the Maven test command.

Build Docker Image: The Docker image is built using the docker file in the current repository and is tagged as the latest version.

Push Docker Image: The built Docker image is then pushed to the Red Hat registry.

Scan Docker Image for Security Vulnerabilities: The pushed Docker image is then scanned for security vulnerabilities using Snyk.

Deploy to OpenShift: The OpenShift manifests (deployment.yaml, service.yaml, and route.yaml) are applied to the OpenShift cluster using the oc CLI.
