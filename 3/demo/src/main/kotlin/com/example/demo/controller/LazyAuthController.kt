package com.example.demo.controller

import com.example.demo.service.LazyAuthService
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class LazyAuthController {

    private val lazyAuthService: LazyAuthService = LazyAuthService.getInstance()

    @PostMapping("/lazy/login")
    fun login(@RequestParam username: String, @RequestParam password: String): String {
        return if (lazyAuthService.authorize(username, password)) {
            "Autoryzacja pomyślna (lazy)"
        } else {
            "Nieprawidłowe dane logowania (lazy)"
        }
    }
}