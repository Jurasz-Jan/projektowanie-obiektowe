Write-Host "✅ Testy jednostkowe:"
python -m unittest discover -s tests/unit

Write-Host "✅ Testy API:"
python -m unittest discover -s tests/api

Write-Host "✅ Testy WebDriver:"
python -m unittest discover -s tests/webdriver
