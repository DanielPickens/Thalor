# Thalor

[![license](https://img.shields.io/badge/license-MIT-green)](https://raw.githubusercontent.com/danielpickens/Thalor/main/LICENSE)
[![build](https://github.com/danielpickens/Thalor//actions/workflows/go.yml/badge.svg?branch=master)](https://github.com/danielpickens/Thalor/actions/workflows/go.yml)

## Overview

 A Go web application wrapper around terraform typescript client that sends and gathers data back to web application for monitoring using a RESTful API with features like JWT Authentication, rate limiting, Swagger documentation, and database operations using GORM. The application uses the Gin Gonic web framework and is containerized using Docker.

## Features

- RESTful API endpoints for CRUD operations.
- JWT Authentication.
- Rate Limiting.
- Swagger Documentation.
- PostgreSQL database integration using GORM.
- Redis cache.
- MongoDB for logging storage.
- Dockerized application for easy setup and deployment.

## Folder structure

```
Thalor/
├── bin
│  └── server
├── cmd
│  └── server
│     └── main.go
├── docker-compose.yml
├── Dockerfile
├── docs
│  ├── docs.go
│  ├── swagger.json
│  └── swagger.yaml
├── go.mod
├── go.sum
├── LICENSE
├── Makefile
├── pkg
│  ├── api
│  │  ├── endpoint.go
│  │  ├── endpoint_test.go
│  │  ├── router.go
│  │  └── user.go
│  ├── auth
│  │  ├── auth.go
│  │  └── auth_test.go
│  ├── cache
│  │  ├── cache.go
│  │  ├── cache_mock.go
│  │  └── cache_test.go
│  ├── database
│  │  ├── db.go
│  │  ├── db_mock.go
│  │  └── db_test.go
│  ├── middleware
│  │  ├── api_key.go
│  │  ├── authenticateJWT.go
│  │  ├── cors.go
│  │  ├── rate_limit.go
│  │  ├── security.go
│  │  └── xss.go
│  └── models
│     ├── example.go
│     └── user.go
├── README.md
├── scripts
│  ├── generate_key
│  └── generate_key.go
└── vendor
```

## Getting Started

### Prerequisites

- Go 1.21+
- Docker
- Docker Compose

### Installation

1. Clone the repository

```bash
git clone https://github.com/danielpickens/Thalor
```

2. Navigate to the directory

```bash
cd Thalor
```

3. Build and run the Docker containers

```bash
make setup && make build && make up
```

### Environment Variables

You can set the environment variables in the `.env` file. Here are some important variables:

- `POSTGRES_HOST`
- `POSTGRES_DB`
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `POSTGRES_PORT`
- `JWT_SECRET`
- `API_SECRET_KEY`

### API Documentation

The API is documented using Swagger and can be accessed at:

```
http://localhost:5247/swagger/index.html
```

## Usage

### Endpoints

- `GET /api/v1/endpoint`: Get all endpoint.
- `GET /api/v1/endpoint/:id`: Get a single endpoint by ID.
- `POST /api/v1/endpoint`: Create a new endpoint.
- `PUT /api/v1/endpoint/:id`: Update a endpoint.
- `DELETE /api/v1/endpoint/:id`: Delete a endpoint.
- `POST /api/v1/login`: Login.
- `POST /api/v1/register`: Register a new user.

### Authentication

To use authenticated routes, you must include the `Authorization` header with the JWT token.

```bash
curl -H "Authorization: Bearer <YOUR_TOKEN>" http://localhost:5247/api/v1/endpoint
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## TODOs

- Unit tests
