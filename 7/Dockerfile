# Single Build Stage (remove duplicate)
FROM swift:5.10 AS build
WORKDIR /app

# Copy dependency files
COPY Package.swift ./
RUN swift package resolve

# Copy entire project
COPY . .

# Build release executable
RUN swift build -c release --product App

# Runtime Stage
FROM swift:5.10
WORKDIR /app

RUN apt-get update && apt-get install -y sqlite3 && rm -rf /var/lib/apt/lists/*
# Copy built executable
COPY --from=build /app/.build/release/App ./app-executable

# Copy migration script and make executable
COPY migration.sh ./
RUN chmod +x migration.sh

# Copy resources
COPY Resources ./Resources
COPY Resources /app/Resources/
COPY Views ./Views 
COPY Views app/Views 

EXPOSE 8080


ENTRYPOINT ["./migration.sh"]