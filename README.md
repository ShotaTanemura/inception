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

# Usage
1. **Build Images**:  
   ```
   make build
   ```
   This command builds the Docker images defined in the `docker-compose.yml` file.

2. **Start Containers**:  
   ```
   make up
   ```
   This command starts the Docker containers defined in the `docker-compose.yml` file in detached mode.

3. **Stop Containers**:  
   ```
   make down
   ```
   This command stops the running Docker containers.

4. **Remove Containers and Images**:  
   ```
   make rm
   ```
   This command stops the running Docker containers and removes both containers and their associated images.

5. **Remove Unused Images**:  
   ```
   make prune
   ```
   This command removes any unused Docker images.

6. **Help**:  
   ```
   make help
   ```
   This command displays available targets with descriptions.

Make sure to navigate to the directory containing the Makefile before running these commands. Additionally, ensure that your `.env` file is properly configured with the necessary environment variables.
