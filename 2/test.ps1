$baseUrl = "http://localhost:8000"

Write-Host "`n➡️  1. GET /product" -ForegroundColor Cyan
Invoke-WebRequest "$baseUrl/product"

Write-Host "`n➡️  2. POST /product/new (create product)" -ForegroundColor Cyan
Invoke-WebRequest -Uri "$baseUrl/product/new" -Method POST -Body @{
    "product[name]" = "TestProduct"
    "product[price]" = "42.50"
} -ContentType "application/x-www-form-urlencoded"

Start-Sleep -Seconds 2

Write-Host "`n➡️  3. GET /product again (should include new product)" -ForegroundColor Cyan
Invoke-WebRequest "$baseUrl/product"

$exampleId = "1"

Write-Host "`n➡️  4. GET /product/$exampleId/edit (load edit form)" -ForegroundColor Cyan
Invoke-WebRequest "$baseUrl/product/$exampleId/edit"

Write-Host "`n➡️  5. POST /product/$exampleId/edit (update product)" -ForegroundColor Cyan
Invoke-WebRequest -Uri "$baseUrl/product/$exampleId/edit" -Method POST -Body @{
    "product[name]" = "UpdatedProduct"
    "product[price]" = "55.99"
} -ContentType "application/x-www-form-urlencoded"

Write-Host "`n➡️  6. POST /product/$exampleId (delete product)" -ForegroundColor Cyan
Invoke-WebRequest -Uri "$baseUrl/product/$exampleId" -Method POST -Body @{
    "_token" = "DUMMY" # <-- tu potrzeba realnego tokena CSRF
} -ContentType "application/x-www-form-urlencoded"
