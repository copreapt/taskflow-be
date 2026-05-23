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
