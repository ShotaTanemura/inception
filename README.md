# inception
This repository is for the project called "Inception" of 42 cursus. This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

# Prerequisites
Before you can run this Dockerized WordPress setup, make sure you have the following installed and configured:

## Docker
Ensure that Docker is installed on your system. You can download and install Docker from [here](https://docs.docker.com/engine/install/).

## Environment Variables
You need to provide environment variables for the project to function correctly. Copy the .env_sample file located in the src directory and create a new file named .env in the same directory. Update the variables in the .env file according to your requirements. Ensure that you define the CERTS_ environmental variable to specify the directory where your SSL certificate and key files are located. This directory should be placed within the src directory.

## HTTP Configuration
This setup is configured to use HTTP for your WordPress site. Make sure you have the SSL certificate and key files ready. These files should be placed in the directory specified by the CERTS_ environmental variable in the .env file. This directory should be located within the src directory.
