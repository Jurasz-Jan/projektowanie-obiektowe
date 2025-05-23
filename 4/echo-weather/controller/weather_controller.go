package controller

import (
	"echo-weather/db"
	"echo-weather/model"
	"echo-weather/proxy"
	"net/http"

	"github.com/labstack/echo/v4"
)

func GetWeather(c echo.Context) error {
	city := c.Param("city")

	temp, desc, err := proxy.GetWeatherData(city)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, echo.Map{"error": err.Error()})
	}

	weather := model.Weather{
		City:        city,
		Temperature: temp,
		Description: desc,
	}

	db.DB.Create(&weather)

	return c.JSON(http.StatusOK, weather)
}
