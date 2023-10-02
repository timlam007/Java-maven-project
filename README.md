# Modern Application CI/CD Pipeline with Podman and GitHub Actions

<p align="center">
<a href="https://github.com/timlam007/Java-maven-project/commits">
  <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/timlam007/Java-maven-project">
</a>
<a href="https://github.com/timlam007/Java-maven-project">
  <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/timlam007/Java-maven-project">
</a>
<a href="https://github.com/timlam007/Java-maven-project/issues">
  <img alt="GitHub issues" src="https://img.shields.io/github/issues/timlam007/Java-maven-project">
</a>
<a href="https://github.com/timlam007/Java-maven-project/pulls">
  <img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/timlam007/Java-maven-project">
</a>
<a href="https://github.com/timlam007/Java-maven-project/blob/master/LICENSE">
  <img alt="GitHub" src="https://img.shields.io/github/license/timlam007/Java-maven-project">
</a>
<a href="https://github.com/timlam007/Java-maven-project/graphs/contributors">
  <img alt="GitHub contributors" src="https://img.shields.io/github/contributors/timlam007/Java-maven-project">
</a>
</p>

## Overview

This repository contains a sample CI/CD pipeline using GitHub Actions for a Java Maven project. The pipeline includes steps for building the project, running tests, performing static code analysis with SonarQube, building a container image using Podman, scanning the image for vulnerabilities with Snyk, and deploying the application to OpenShift Sandbox

The workflow is organized into several jobs, each handling a specific part of the continuous integration and deployment process:
1.  **Extract-Branch-Name**: This job is responsible for extracting the branch name from the current Git branch reference and setting it as an output variable (branch_name) to be used in other jobs.
1.  **Build**: This job compiles the Java application, runs unit tests, and performs static code analysis using SonarQube.
2.  **Build-container**: This job builds a Podman container image of the application and pushes the image to the Quay.io container registry.
3.  **Scan-security-vulnerabilities**: This job scans the Podman container image for security vulnerabilities using Snyk.
4.  **Deploy**: This job deploys the application to an OpenShift cluster using the OpenShift CLI (oc).

## Prerequisites

1.  A GitHub account.
2.  A Quay.io account.
3.  An OpenShift account.
4.  A SonarQube account.
5.  A Snyk account.

## Setup

1.  **Fork the Repository**
    Fork this repository to your own GitHub account.

2.  **Set up Secrets**
    Navigate to the **Settings** tab of your GitHub repository, then click on **Environments** in the left sidebar. then select Environments. Add the following secrets:
- **SONARQUBE_URL**: Your SonarQube URL. 
- **SONARQUBE_TOKEN**: Your SonarQube token. 
- **RH_REGISTRY_USERNAME**: Your Red Hat registry username. 
- **RH_REGISTRY_PASSWORD**: Your Red Hat registry password. 
- **SNYK_TOKEN**: Your Snyk token.

3.  **Modify the Workflow File**
    Modify the **.github/workflows/main.yml** file to suit your needs. For example, you may need to change the OpenShift server URL, project name, or image name.

4.  **Commit and Push**
    Commit and push your changes to the **QA** branch.

5.  **Pull Request**
    Create a Pull request from **QA** to **PROD**

## Usage

Once you have set up your repository, any push to the **main** branch will trigger the CI/CD workflow. You can view the progress in the **Actions** tab of your GitHub repository.

## OpenShift Setup before running the Pipeline

    oc create serviceaccount my-app-serviceaccount

    oc create secret docker-registry tim-secret --docker-server=quay.io  --docker-username="XXXX"  --docker-password="XXXXXXXX"

## Detailed Workflow Steps
1. **Extract Branch Name**
   This step is responsible for extracting the branch name from the current Git branch reference and setting it as an output variable (branch_name) to be used in other jobs. 

2.  **Check Ubuntu Virtual Environment**
    This step prints the details of the GitHub Actions runner environment. It will print the Linux distribution details, IP address, memory, CPU, disk usage, current working directory, and date and time.

2.  **Checkout Repository**
    This step checks out the repository, so the workflow can access the contents of your repository.

3.  **Set up Java**
    This step sets up a specific version of the Java JDK. In this case, it sets up Adopt OpenJDK 11.

4.  **Download SonarScanner**
    This step downloads and installs SonarScanner, which is used for static code analysis.

5.  **Build Maven Project**
    This step compiles the Java application using Maven.

6.  **Run JUnit Tests**
    This step runs the unit tests of the application using Maven.

7.  **Run SonarQube Analysis**
    This step runs a SonarQube analysis of the code.

8.  **Install Podman**
    This step installs Podman on the runner.

9.  **Login to Red Hat Registry**
    This step logs in to the Red Hat and Quay.io container registries.

10. **Build Podman Image**
    This step builds a Podman container image of the application.

11. **Push Podman Image**
    This step pushes the Podman container image to the Quay.io container registry.

12. **Echo masked SNYK_TOKEN**
    This step prints a masked version of the SNYK_TOKEN.

13. **Scan Podman image**
    This step scans the Podman container image for security vulnerabilities using Snyk.

14. **Install OpenShift CLI (oc)**
    This step installs the OpenShift CLI (oc) on the runner.

15. **Set up OpenShift CLI**
    This step logs in to the OpenShift cluster using a token.

16. **Apply OpenShift Manifests**
    This step applies the OpenShift manifests (deployment.yaml, service.yaml, route.yaml) to deploy the application to the OpenShift cluster.

## Workflow Diagram

<p align="center">
<img src="https://i.ibb.co/VBhnmj6/Screenshot-2023-09-03-at-2-12-46-PM.png" alt="workflow diagram" border="0" width="300">
</p>

## Author

Made with ❤️ by [Timothy Lam](https://github.com/timlam007)
