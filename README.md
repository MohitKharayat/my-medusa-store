# Medusa Docker Setup

## Overview

This repository contains a Docker setup for running the Medusa headless commerce platform locally. It uses Docker and Docker Compose to containerize the Medusa application and PostgreSQL database.

## Prerequisites

- **Docker**: Make sure Docker is installed on your local machine.
- **Docker Compose**: Make sure Docker Compose is installed on your local machine.

## Getting Started

Follow these instructions to get a local instance of Medusa up and running using Docker.

### 1. Clone the Repository

```sh
git clone https://github.com/MohitKharayat/my-medusa-store.git
cd my-medusa-store
```

### 2. Build the Docker Images

Run the following command to build the Docker images defined in the Dockerfile and Docker Compose configuration:

```sh
docker-compose build
```

### 3. Start the Containers

Use the following command to start the Medusa and PostgreSQL containers:

```sh
docker-compose up
```

This will start both Medusa and PostgreSQL services. Medusa will be available on port 9000 and PostgreSQL will be available on port 5432.

### 4. Access the Application

 [http://localhost:7001](http://localhost:7001)

### 5. Stop the Containers

To stop and remove the containers, use:

```sh
docker-compose down
```

## Configuration

### Environment Variables

The `docker-compose.yml` file sets up the following environment variables for the Medusa service:

- `JWT_SECRET`: Secret key for JSON Web Tokens.
- `COOKIE_SECRET`: Secret key for cookies.
- `DATABASE_TYPE`: Type of database being used (PostgreSQL).
- `DATABASE_URL`: URL for connecting to the PostgreSQL database.

### Ports

- **Medusa Backend**: Port 7001
- **PostgreSQL Database**: Port 5432

### Dockerfile

The `Dockerfile` used to build the Medusa application container includes:

- Base image: `node:18`
- Working directory set to `/usr/src/app`
- Copies `package.json` and `package-lock.json` for dependency installation
- Copies application code
- Exposes ports 9000 and 7001
- Starts Medusa with `npx medusa develop`

### Docker Compose

The `docker-compose.yml` file defines two services:

- **medusa**: Builds from the Dockerfile, sets environment variables, maps ports, and depends on the PostgreSQL service.
- **postgres**: Uses the official PostgreSQL image, sets up environment variables for PostgreSQL, and maps port 5432.

## Troubleshooting

- **Address Already in Use**: Ensure no other services are using the same ports. You may need to stop conflicting services or adjust port mappings in `docker-compose.yml`.
- **Connection Issues**: Verify that both Medusa and PostgreSQL containers are running correctly. Check Docker logs for more details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

