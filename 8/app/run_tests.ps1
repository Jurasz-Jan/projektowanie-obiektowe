$env:PYTHONPATH = "$PSScriptRoot\app"

Write-Host "`n🧪 Testy jednostkowe:"
python -m unittest discover -s app/tests/unit -t app -p "*.py"

Write-Host "`n🧪 Testy API:"
python -m unittest discover -s app/tests/api -t app -p "*.py"

Write-Host "`n🧪 Testy WebDriver:"
python -m unittest discover -s app/tests/webdriver -t app -p "*.py"
