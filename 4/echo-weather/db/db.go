package db

import (
	"echo-weather/model"

	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

var DB *gorm.DB

func InitDB() {
	database, err := gorm.Open(sqlite.Open("weather.db"), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}
	database.AutoMigrate(&model.Weather{})
	DB = database
}
