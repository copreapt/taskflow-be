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
