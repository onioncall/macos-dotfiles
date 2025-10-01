#!/bin/zsh

# Check if an argument was provided
if [[ $# -eq 0 ]]; then
  echo "Error: Please provide a project name"
  echo "Usage: $0 project_name"
  exit 1
fi

# Get the project name from the first argument
project_name=$1

# Create the project directory
mkdir -p "$project_name"
cd $project_name

# initialize project
go mod init "github.com/onioncall/$project_name"

# create folder structure 
mkdir cmd
mkdir cmd/server

mkdir internal
mkdir internal/handlers
mkdir internal/models
mkdir internal/services
mkdir internal/config
mkdir internal/repositories

# Dockerfile
touch Dockerfile

cat > Dockerfile << EOF
# Build stage
FROM golang:1.24-alpine AS builder

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod go.sum* ./

# Download dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./cmd/server

# Final stage
FROM alpine:3.18

# Add CA certificates for HTTPS requests
RUN apk --no-cache add ca-certificates

WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/main .

# The PORT will be provided by docker-compose
CMD ["./main"]
EOF

# Docker Compose
touch compose.yaml

cat > compose.yaml << EOF
version: '3'
services:

	api:
		build: .
		environment:
		  - PORT=8080
		ports:
		  - "8080:8080"
	
	db:
		image: postgres
		environment:
			- POSTGRES_USER=postgres
			- POSTGRES_PASSWORD=postgres
		ports: 
			- 5432:5432
		volumes:
			- postgres_data:/var/lib/postgresql/data
		 
	volumes:
		postgres_data:
	
EOF

# sqlc setup
touch sqlc.yaml

cat > sqlc.yaml << EOF
version: "2"
sql:
  - engine: "postgresql"
    queries: "db/queries"
    schema: "db/schema"
    gen:
      go:
        package: "db"
        out: "internal/repositories/db"
        emit_json_tags: true
        emit_prepared_queries: true
        emit_interface: true
		sql_package: "pgx/v5"
EOF

# config.go
touch internal/config/environment.go

cat > internal/config/environment.go << EOF
package config

import (
	"os"
)

var env string = "dev"

func GetEnv() string {
	return env
}

func SetEnv() {
	if os.Getenv("ENVIRONMENT") == "production" {
		env = "prod"	
	}
}
EOF

# main.go
touch cmd/server/main.go

cat > cmd/server/main.go << EOF
package main

import ( 
	"github.com/onioncall/$project_name/internal/handlers"
	"github.com/onioncall/$project_name/internal/config"
)

func main() {
	port := ":8080"
	handlers.RegisterRoutes(port)

	config.SetEnv()
}
EOF

# routes.go
touch internal/handlers/routes.go

cat > internal/handlers/routes.go << EOF
package handlers

import (
	"fmt"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/httplog"
	"github.com/onioncall/test-project/internal/config"
)

func RegisterRoutes(port string) {	
	// Initialize the logger
	logger := httplog.NewLogger("api", httplog.Options{
		JSON:             true,
		LogLevel:         "info",
		Concise:          false,
		Tags: map[string]string{
			"env": config.GetEnv(),
			"app": "test-project",
		},
	})

	// Create a new router with the logger
	r := chi.NewRouter()
	
	// Add httplog middleware to the router
	r.Use(httplog.RequestLogger(logger))

	// register route groups
	registerIndexRoutes(r)
	registerApiRoutes(r)

	fmt.Printf("Server listening on http://localhost%s\n", port)
	err := http.ListenAndServe(port, r)
	if err !=  nil {
		panic(err)
	}
}

func registerIndexRoutes(r chi.Router) {
	r.Get("/", indexHandler)
}

func registerApiRoutes(r chi.Router) {
	// Route Group
	r.Route("/api", func(r chi.Router) {
		r.Get("/product", apiProductHandler)
	})	
}

func indexHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Welcome to the homepage!")
}

func apiProductHandler(w http.ResponseWriter, r *http.Request) {
	query := r.URL.Query()
	id := query.Get("id")
	data := fmt.Sprintf("some product data from the api, %s", id)
	fmt.Fprintln(w, data)
}
EOF

# install dependencies
go get github.com/go-chi/chi/v5
go get github.com/jackc/pgx/v5
go get -u github.com/go-chi/httplog
go mod tidy

echo "finished scaffolding $project_name"
