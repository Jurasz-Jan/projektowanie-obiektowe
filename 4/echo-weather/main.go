package main

import (
	"echo-weather/controller"
	"echo-weather/db"

	"github.com/joho/godotenv"
	"github.com/labstack/echo/v4"
)

func main() {
	godotenv.Load()
	e := echo.New()
	db.InitDB() // inicjalizacja bazy i migracje

	e.GET("/weather/:city", controller.GetWeather)

	e.Logger.Fatal(e.Start(":8080"))
}

// echo-weather/controller/weather.go
