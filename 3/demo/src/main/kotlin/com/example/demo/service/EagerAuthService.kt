package com.example.demo.service

import org.springframework.stereotype.Service

@Service
class EagerAuthService {

    init {
        println("Inicjalizacja EagerAuthService")
    }

    private val users = mapOf(
        "user1" to "pass1",
        "user2" to "pass2"
    )

    fun authorize(username: String, password: String): Boolean {
        return users[username] == password
    }
}