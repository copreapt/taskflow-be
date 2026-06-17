# Taskflow API

NestJS backend for the Taskflow task management app.

## Tech Stack

- NestJS
- MongoDB
- Docker
- Typescript

## Prerequisites

- Node 22
- Docker Desktop
- npm

## Local Development

1. Start MongoDB:
   docker-compose up mongo

2. Start the server:
   npm run start:dev

Server runs on http://localhost:3001

## Environment Variables

Copy `.env.example` to `.env.local` and fill in the values.

| Variable    | Description               |
| ----------- | ------------------------- |
| PORT        | Server Port (3001)        |
| MONGODB_URI | MongoDB connection string |
| NODE_ENV    | Environment (development) |

## CI/CD

This project uses Github Actions for continuous integration.

The pipeline runs automatically on every push and pull request to `main` and `staging` branches.

### Pipeline steps

1. Install dependencies
2. Run linter
3. Run type check
4. Build

## Docker

### Local Development

Start MongoDB only:
docker-compose up mongo

### Building Production Image

docker build -t taskflow-backend .

### Docker Compose Files

| File                            | Purpose                          |
| ------------------------------- | -------------------------------- |
| `docker-compose.yml`            | Local development (MongoDB only) |
| `docker-compose.staging.yml`    | Staging deployment on EC2        |
| `docker-compose.production.yml` | Production deployment on EC2     |

### Image Sizes

| Image              | Content Size |
| ------------------ | ------------ |
| `taskflow-backend` | 86.8MB       |

## Deployment

### Staging

- **Server**: AWS EC2 t3.micro (eu-north-1)
- **Docker image**: copreapt/taskflow-backend:staging

#### Manual deployment steps

1. Build and push image to Docker Hub:
   docker build -t copreapt/taskflow-backend:staging .
   docker push copreapt/taskflow-backend:staging

2. SSH into EC2:
   ssh -i <staging-key>.pem ubuntu@<staging-ip>

3. Pull and run:
   docker pull copreapt/taskflow-backend:staging
   docker-compose -f docker-compose.backend.yml up -d

## CI/CD Pipeline

This project uses GitHub Actions for continuous integration and deployment.

### How it works

| Branch       | CI                 | Deployment                                |
| ------------ | ------------------ | ----------------------------------------- |
| `main`       | Runs on every push | Deploys to production (requires approval) |
| `staging`    | Runs on every push | Deploys to staging (automatic)            |
| Pull Request | Runs on every PR   | No deployment                             |

### Pipeline steps

1. Lint
2. Type check
3. Build
4. Deploy (if branch is `staging` or `main`)

### Environments

| Environment | Frontend                    | Backend                     |
| ----------- | --------------------------- | --------------------------- |
| Staging     | http://<staging-ip>:3000    | http://<staging-ip>:3001    |
| Production  | http://<production-ip>:3000 | http://<production-ip>:3001 |

### Required GitHub Secrets

| Secret             | Description                    |
| ------------------ | ------------------------------ |
| `DOCKER_USERNAME`  | Docker Hub username            |
| `DOCKER_PASSWORD`  | Docker Hub access token        |
| `EC2_HOST`         | Staging EC2 IP                 |
| `EC2_USER`         | Staging EC2 username           |
| `EC2_SSH_KEY`      | Staging EC2 SSH private key    |
| `EC2_PROD_HOST`    | Production EC2 IP              |
| `EC2_PROD_USER`    | Production EC2 username        |
| `EC2_PROD_SSH_KEY` | Production EC2 SSH private key |
| `MONGODB_URI`      | Staging MongoDB Atlas URI      |
| `MONGODB_URI_PROD` | Production MongoDB Atlas URI   |
