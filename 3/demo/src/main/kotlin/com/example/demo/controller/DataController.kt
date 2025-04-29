package com.example.demo.controller

import com.example.demo.model.User
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class DataController {

    private val users = listOf(
        User(1, "john.doe", "john.doe@example.com"),
        User(2, "jane.smith", "jane.smith@example.com"),
        User(3, "peter.jones", "peter.jones@example.com")
    )

    @GetMapping("/users")
    fun getUsers(): List<User> {
        return users
    }
}