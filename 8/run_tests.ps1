Write-Host "✅ Testy jednostkowe:"
python -m unittest discover -s app/tests/unit

Write-Host "✅ Testy API:"
python -m unittest discover -s app/tests/api

Write-Host "✅ Testy WebDriver:"
python -m unittest discover -s app/tests/webdriver
