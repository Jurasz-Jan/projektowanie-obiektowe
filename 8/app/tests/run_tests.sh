#!/bin/bash
echo "Czekam aż serwer się uruchomi..."
sleep 5

echo "✅ Testy jednostkowe:"
python3 -m unittest discover -s /app/tests/unit

echo "✅ Testy API:"
python3 -m unittest discover -s /app/tests/api

echo "✅ Testy WebDriver:"
python3 -m unittest discover -s /app/tests/webdriver
