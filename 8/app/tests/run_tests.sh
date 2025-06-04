Write-Host "🧪 Testy jednostkowe:"
cd app
python -m unittest discover -s tests/unit -p "*.py" -t .

Write-Host "`n🧪 Testy API:"
python -m unittest discover -s tests/api -p "*.py" -t .

Write-Host "`n🧪 Testy WebDriver:"
python -m unittest discover -s tests/webdriver -p "*.py" -t .
