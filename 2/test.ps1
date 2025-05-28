$base = "http://localhost:8000/api/product"

Write-Host "`n▶️ 1. Tworzenie nowego produktu..." -ForegroundColor Cyan
$response = Invoke-RestMethod -Uri $base -Method POST -Body '{"name":"Wiertarka","price":199.99}' -ContentType "application/json"
$productId = $response.id
Write-Host "✅ Utworzono produkt o ID: $productId"

Write-Host "`n▶️ 2. Pobieranie wszystkich produktów..." -ForegroundColor Cyan
Invoke-RestMethod -Uri $base

Write-Host "`n▶️ 3. Pobieranie produktu o ID: $productId..." -ForegroundColor Cyan
Invoke-RestMethod -Uri "$base/$productId"

Write-Host "`n▶️ 4. Aktualizacja produktu..." -ForegroundColor Cyan
Invoke-RestMethod -Uri "$base/$productId" -Method PUT -Body '{"name":"Wiertarka PRO","price":249.99}' -ContentType "application/json"
Write-Host "✅ Zaktualizowano produkt."

Write-Host "`n▶️ 5. Ponowne pobranie po aktualizacji..." -ForegroundColor Cyan
Invoke-RestMethod -Uri "$base/$productId"

Write-Host "`n▶️ 6. Usuwanie produktu..." -ForegroundColor Cyan
Invoke-RestMethod -Uri "$base/$productId" -Method DELETE
Write-Host "✅ Usunięto produkt."

Write-Host "`n▶️ 7. Sprawdzenie czy produkt został usunięty..." -ForegroundColor Cyan
try {
    Invoke-RestMethod -Uri "$base/$productId"
} catch {
    Write-Host "❌ Nie znaleziono produktu (oczekiwane)."
}
