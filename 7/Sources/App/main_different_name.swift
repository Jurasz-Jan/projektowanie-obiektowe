// Sources/App/main.swift
import Vapor
@preconcurrency import Foundation // Dodaj Foundation, jeśli używasz np. Print

@main
struct Entrypoint {
    static func main() async throws {
        var env = try Environment.detect()
        try LoggingSystem.bootstrap(from: &env) // Konfiguracja logowania

        // Zmień to: Użyj Application.make(env) dla kontekstów asynchronicznych
        let app = try await Application.make(env)
        defer { app.shutdown() }    // Upewniamy się, że aplikacja zostanie zamknięta

        try await configure(app)    // Wywołanie funkcji konfiguracyjnej

        // Zmień to: Użyj app.execute() dla kontekstów asynchronicznych
        try await app.execute()     // Uruchamia serwer i czeka na sygnał zamknięcia
    }
}