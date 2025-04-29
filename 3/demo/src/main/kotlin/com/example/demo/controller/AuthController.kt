package com.example.demo.controller

import com.example.demo.service.EagerAuthService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class AuthController {

    @Autowired
    private lateinit var authService: EagerAuthService

    @PostMapping("/login")
    fun login(@RequestParam username: String, @RequestParam password: String): String {
        return if (authService.authorize(username, password)) {
            "Autoryzacja pomyślna"
        } else {
            "Nieprawidłowe dane logowania"
        }
    }
}