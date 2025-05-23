package proxy

import (
	"encoding/json"

	"github.com/go-resty/resty/v2"
)

type WeatherAPIResponse struct {
	Main struct {
		Temp float64 `json:"temp"`
	} `json:"main"`
	Weather []struct {
		Description string `json:"description"`
	} `json:"weather"`
}

func GetWeatherData(city string) (float64, string, error) {
	client := resty.New()
	apiKey := "your_openweathermap_api_key"
	resp, err := client.R().
		Get("https://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey + "&units=metric")
	if err != nil {
		return 0, "", err
	}
	var data WeatherAPIResponse
	json.Unmarshal(resp.Body(), &data)

	return data.Main.Temp, data.Weather[0].Description, nil
}
