FROM swift:5.9

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y libsqlite3-dev && \
    swift build -c release

CMD ["swift", "run", "-c", "release", "Run", "--env", "production", "--hostname", "0.0.0.0", "--port", "8080"]
