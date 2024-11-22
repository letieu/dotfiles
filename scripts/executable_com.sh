#!/bin/bash

start_docker() {
  if ! systemctl is-active --quiet docker; then
    echo "Starting Docker..."
    sudo systemctl start docker
  else
    echo "Docker is already running."
  fi
}

start_postgres_container() {
  CONTAINER_NAME="postgres_local"
  if ! docker ps --format '{{.Names}}' | grep -q "^$CONTAINER_NAME\$"; then
    echo "Starting PostgreSQL Docker container..."
    docker start "$CONTAINER_NAME"
  else
    echo "PostgreSQL Docker container is already running."
  fi
}

# Start Docker if necessary
start_docker

# Start PostgreSQL Docker container if necessary
start_postgres_container

# Run docker-compose in Kafka directory
echo "Starting Kafka Docker Compose..."
(cd ~/code/ONE/utils/kafka && docker-compose up -d)

sleep 5

# Run opa-mock script
echo "Running opa-mock..."
nohup ~/code/ONE/utils/opa-mock/opa-mock > /dev/null 2>&1 &

# Open Neovim in auth-backend directory and start the backend service in a horizontal split
kitty @ launch --type=tab --tab-title=auth-be --cwd=/home/tieu/code/ONE/om-com-auth-backend nvim
kitty @ launch --cwd=/home/tieu/code/ONE/om-com-auth-backend --location=hsplit sh -c "
  KAFKA_BROKER_URI=localhost:9093 yarn auth-backend:start:dev
"

# Open Neovim in BFF directory and start the BFF service in a horizontal split
kitty @ launch --type=tab --tab-title=bff --cwd=/home/tieu/code/ONE/om-com-bff nvim
kitty @ launch --cwd=/home/tieu/code/ONE/om-com-bff --location=hsplit sh -c "
  KAFKA_BROKER_URI=localhost:9093 yarn start:dev
"

# Open Neovim in COM-frontend directory and start service in a horizontal split
kitty @ launch --type=tab --tab-title=fe --cwd=/home/tieu/code/ONE/om-com-frontend nvim
kitty @ launch --cwd=/home/tieu/code/ONE/om-com-frontend --location=hsplit sh -c "
  yarn dev:https
"
