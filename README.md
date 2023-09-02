CI/CD Pipeline with GitHub Actions
This repository contains a sample CI/CD pipeline using GitHub Actions for a Java Maven project. The pipeline includes steps for building the project, running tests, static code analysis with SonarQube, building a Docker image, scanning the Docker image for vulnerabilities with Snyk, and deploying the application to OpenShift.

Workflow
The CI/CD pipeline consists of the following jobs:

build: This job checks the virtual environment, sets up Java, downloads SonarScanner, builds the Maven project, runs JUnit tests, and performs a SonarQube analysis.

build-container: This job checks out the repository, sets up Docker, logs in to the Red Hat registry, builds the Docker image, and pushes the Docker image to the registry.

scan-security-vulnerabilities: This job checks out the repository, scans the Docker image for security vulnerabilities using Snyk, and continues to the next job even if vulnerabilities are found.

deploy: This job checks out the repository, installs the OpenShift CLI, logs in to the OpenShift cluster, and applies the OpenShift manifests (deployment, service, and route) to deploy the application.

Usage
Fork this repository.
Create the following secrets in your GitHub repository:
SONARQUBE_TOKEN: Your SonarQube token.
SONARQUBE_URL: Your SonarQube server URL.
RH_REGISTRY_USERNAME: Your Red Hat registry username.
RH_REGISTRY_PASSWORD: Your Red Hat registry password.
SNYK_TOKEN: Your Snyk token.
Update the oc login command in the deploy job with your OpenShift token and server URL.
Update the OpenShift manifests (deployment.yaml, service.yaml, route.yaml) in the deploy job with your application's configuration.
Push changes to the main branch to trigger the CI/CD pipeline.
File Structure
.github/workflows/ci-cd.yml: This file contains the GitHub Actions workflow configuration.
src/: This directory contains the source code of the Java Maven project.
Dockerfile: This file contains the Docker image build instructions.
pom.xml: This file contains the Maven project configuration.
Requirements
A GitHub account.
A SonarQube account and a SonarQube token.
A Red Hat registry account and a Red Hat registry token.
A Snyk account and a Snyk token.
An OpenShift cluster and an OpenShift token.


here is a brief explanation of each step in the CI/CD pipeline:

Push to Main Branch: This is the trigger for the entire workflow. Whenever there is a push to the main branch, the workflow is initiated.

Build Maven Project: In this step, the Maven project is built using the mvn clean install command. This command cleans the project, compiles the source code, and installs the compiled code into the local repository.

Run JUnit Tests: Here, the JUnit tests are run using the mvn test command. This step ensures that the code is functioning as expected and that recent changes have not introduced any bugs.

Run SonarQube Analysis: This step involves running a SonarQube analysis on the code. SonarQube is a tool that checks the code for code smells, bugs, and security vulnerabilities. It also calculates code coverage and other code quality metrics.

Build Docker Image: In this step, a Docker image of the application is built. This image contains everything needed to run the application, including the code, runtime, libraries, and environment variables.

Push Docker Image: The Docker image built in the previous step is pushed to a Docker registry. In this case, the image is pushed to the Red Hat registry and quay.io.

Scan Docker Image for Vulnerabilities: The Docker image is scanned for security vulnerabilities using Snyk. Snyk is a tool that checks for known vulnerabilities in the Docker image and its dependencies.

Deploy to OpenShift: Finally, the application is deployed to OpenShift. OpenShift is a Kubernetes distribution that provides developer and operational tools on top of Kubernetes. The deployment is done using OpenShift CLI (oc) and the manifests in deployment.yaml, service.yaml, and route.yaml.


![image](https://github.com/timlam007/Java-maven-project/assets/89241319/61602812-427c-4631-8bc4-7bff06480ab5)
