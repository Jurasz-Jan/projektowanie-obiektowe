FROM vapor/swift:5.2 as build

WORKDIR /app
COPY . .

RUN swift build -c release

FROM vapor/swift:5.2

WORKDIR /app
COPY --from=build /app/.build/release/Run .

EXPOSE 8080
CMD ["./Run", "serve", "--env", "production", "--hostname", "0.0.0.0", "--port", "8080"]
