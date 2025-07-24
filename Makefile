# Makefile to manage Docker Compose services

# Define variables for the compose files to avoid repetition
POSTGRES_COMPOSE = docker/postgres.docker-compose.yaml
QDRANT_COMPOSE = docker/qdrant.docker-compose.yaml

# Use .PHONY to ensure these targets run even if files with the same name exist
.PHONY: run down

# Target to start and run the services in detached mode
run:
	@echo "Starting PostgreSQL and Qdrant services..."
	docker compose -f $(POSTGRES_COMPOSE) --env-file .env up -d
	docker compose -f $(QDRANT_COMPOSE) up -d
	@echo "Services are up and running."

# Target to stop the services and remove volumes
down:
	@echo "Stopping PostgreSQL and Qdrant services and removing volumes..."
	docker compose -f $(POSTGRES_COMPOSE) --env-file .env down -v
	docker compose -f $(QDRANT_COMPOSE) down -v
	@echo "Services have been stopped and volumes removed."

