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
  docker compose -f /home/tieu/code/ONE/utils/docker-compose.yml up -d db
}

# Start Docker if necessary
start_docker

# Start PostgreSQL Docker container if necessary
start_postgres_container

# Open Neovim in auth-backend directory and start the backend service in a horizontal split
kitty @ launch --type=tab --tab-title=auth-be --cwd=/home/tieu/code/ONE/om-com-auth-backend nvim
kitty @ launch --cwd=/home/tieu/code/ONE/om-com-auth-backend --location=hsplit sh -c "
  yarn auth-backend:start:dev
"

# Open Neovim in BFF directory and start the BFF service in a horizontal split
kitty @ launch --type=tab --tab-title=bff --cwd=/home/tieu/code/ONE/om-com-bff nvim
kitty @ launch --cwd=/home/tieu/code/ONE/om-com-bff --location=hsplit sh -c "
  yarn start:dev
"

# Open Neovim in COM-frontend directory and start service in a horizontal split
kitty @ launch --type=tab --tab-title=fe --cwd=/home/tieu/code/ONE/om-com-frontend nvim
kitty @ launch --cwd=/home/tieu/code/ONE/om-com-frontend --location=hsplit sh -c "
  yarn dev
"
