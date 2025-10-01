#!/bin/zsh

# Check if container already exists
if docker ps -a | grep -q postgres; then
    echo "Container 'postgres' already exists. Starting if not running..."
    docker start postgres
else
    echo "Creating and starting new postgres container..."
    docker run \
        --name postgres \
        -e POSTGRES_USER=postgres \
        -e POSTGRES_PASSWORD=postgres \
        -p 5432:5432 \
        -v postgres_data:/var/lib/postgresql/data \
        postgres
fi

# Wait for container to be ready
echo "Waiting for PostgreSQL to be ready..."
sleep 5

# Check if container is running
if docker ps | grep -q postgres; then
    echo "PostgreSQL is running on port 5432"
    echo "Connect using: psql -h localhost -U postgres"
else
    echo "Failed to start PostgreSQL container"
    docker logs postgres
fi
