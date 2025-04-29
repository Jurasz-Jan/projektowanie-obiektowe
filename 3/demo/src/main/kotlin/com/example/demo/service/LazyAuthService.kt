package com.example.demo.service

import org.springframework.stereotype.Service

@Service
class LazyAuthService {

    init {
        println("Inicjalizacja LazyAuthService")
    }

    private val users = mapOf(
        "guest" to "secret",
        "admin" to "1234"
    )

    fun authorize(username: String, password: String): Boolean {
        return users[username] == password
    }

    companion object {
        @Volatile
        private var instance: LazyAuthService? = null

        fun getInstance(): LazyAuthService {
            return instance ?: synchronized(this) {
                instance ?: LazyAuthService().also { instance = it }
            }
        }
    }
}