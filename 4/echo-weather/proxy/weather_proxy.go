package proxy

import (
	"encoding/json"
	"fmt"

	"github.com/go-resty/resty/v2"
)

type WeatherAPIResponse struct {
	CurrentCondition []struct {
		Temp_C      string `json:"temp_C"`
		WeatherDesc []struct {
			Value string `json:"value"`
		} `json:"weatherDesc"`
	} `json:"current_condition"`
}

func GetWeatherData(city string) (float64, string, error) {
	client := resty.New()

	url := fmt.Sprintf("https://wttr.in/%s?format=j1", city)

	resp, err := client.R().Get(url)
	if err != nil {
		return 0, "", err
	}

	var data WeatherAPIResponse
	err = json.Unmarshal(resp.Body(), &data)
	if err != nil {
		return 0, "", err
	}

	// sprawdź czy mamy dane
	if len(data.CurrentCondition) == 0 || len(data.CurrentCondition[0].WeatherDesc) == 0 {
		return 0, "", fmt.Errorf("brak danych pogodowych")
	}

	// parsowanie stringa na float
	var temp float64
	fmt.Sscanf(data.CurrentCondition[0].Temp_C, "%f", &temp)

	desc := data.CurrentCondition[0].WeatherDesc[0].Value
	return temp, desc, nil
}
