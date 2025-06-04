# Jeszcze poprawiam README i dema



Zadanie 1 Tytuł

✅ 3.0 wymaganie 1 Ścieżka do pliku/folderu 1

✅ 3.5 wymaganie 2 ścieżka do pliku/folderu 2

✅ 4.0 wymaganie 3 ścieżka do pliku/folderu 3

❌ 4.5 wymaganie 4 ścieżka do pliku/folderu 4

❌ 5.0 wymaganie 5 ścieżka do pliku/folderu 5

Kod: (folder lub branch)

# ✅ Zadanie 4 – Echo Proxy

## 📁 Kod projektu:
`projektowanie-obiektowe/4`

---

Zadanie 4 Echo-gorm

✅ 3.0 wymaganie 1 – Należy stworzyć aplikację we frameworku Echo w j. Go, która będzie miała kontroler Pogody, umożliwiający pobieranie danych pogodowych  
`backend/main.go`, `controller/weather_controller.go`

✅ 3.5 wymaganie 2 – Należy stworzyć model `Pogoda` wykorzystując GORM oraz załadować dane z listy przy uruchomieniu  
`model/weather.go`, `db/db.go`

✅ 4.0 wymaganie 3 – Należy stworzyć klasę proxy, która pobiera dane pogodowe z zewnętrznego serwisu w trakcie zapytania  
`proxy/weather_proxy.go`

✅ 4.5 wymaganie 4 – Należy zapisać pobrane dane z zewnętrznego API do bazy danych   
`controller/weather_controller.go`, `model/weather.go`

✅ 5.0 wymaganie 5 – Należy rozszerzyć endpoint na obsługę więcej niż jednej lokalizacji i zwracać dane w formacie JSON  
`controller/weather_controller.go`, `tests/api/`, `tests/functional/`


✅ Zadanie 6 – Zapaszki (Sonar + React)
📁 Kod projektu:
projektowanie-obiektowe/5

✅ Zadanie 5 – Sklep w React
📁 Kod projektu:
projektowanie-obiektowe/5

Zadanie 5 – React App: Sklep z koszykiem, kategoriami i płatnością

✅ 3.0 wymaganie 1 – Należy stworzyć aplikację w React z widokiem produktów oraz koszykiem
5/src/App.tsx, 5/src/components/Products.tsx, 5/src/components/Cart.tsx

✅ 3.5 wymaganie 2 – Należy zintegrować dane z serwera (np. produkty, kategorie) i wyświetlać je w aplikacji
5/src/components/Products.tsx, axios.get("http://localhost:3001/products"), axios.get("http://localhost:3001/categories")

✅ 4.0 wymaganie 3 – Należy umożliwić dodawanie produktów do koszyka i przekierowanie do widoku koszyka
5/src/context.tsx, useAppContext(), useNavigate(), routing React Router

✅ 4.5 wymaganie 4 – Należy dodać wysyłkę koszyka (symulacja płatności) z czyszczeniem koszyka i komunikatem
5/src/components/Payments.tsx, axios.post("/orders"), setCart([]), setMessage("✅ Order sent!")

✅ 5.0 wymaganie 5 – Należy dodać routing i podział na widoki (produkty / koszyk) z menu nawigacyjnym
5/src/App.tsx, react-router-dom, Route path="/", Route path="/cart"

Kod: projektowanie-obiektowe/5



Zadanie 6 Zapaszki (Sonar + ESLint)

✅ 3.0 wymaganie 1 – Należy dodać ESLint w hookach Gita
.husky/pre-commit, package.json, 5/.eslintrc.json

✅ 3.5 wymaganie 2 – Należy wyeliminować wszystkie błędy typu Bugs w kodzie aplikacji klienckiej (wg SonarCloud)
5/src/App.tsx, 5/src/components/Cart.tsx, 5/src/context.tsx

✅ 4.0 wymaganie 3 – Należy wyeliminować wszystkie Code Smells w kodzie aplikacji klienckiej
5/src/App.tsx, 5/src/components/Cart.tsx, 5/src/components/Products.tsx

✅ 4.5 wymaganie 4 – Należy wyeliminować wszystkie podatności oraz błędy bezpieczeństwa (Vulnerabilities & Security Hotspots)
5/src/App.tsx, 5/src/components/Payments.tsx

✅ 5.0 wymaganie 5 – Zredukować duplikaty kodu do 0%
(zrefaktoryzowano powielone fragmenty logiczne; brak powtórzeń w komponentach)

Kod: projektowanie-obiektowe/5


# ✅ Zadanie 7 – Antywzorce (Vapor)
📁 Kod projektu:
projektowanie-obiektowe/7

Zadanie 7 Antywzorce (Vapor)

✅ 3.0 wymaganie 1 – Należy stworzyć model Product oraz kontroler ProductController z pełnym CRUD
Sources/App/Models/Product.swift, Sources/App/Controllers/ProductController.swift

✅ 3.5 wymaganie 2 – Należy stworzyć szablony Leaf (index, products, product_form) i wykorzystać #extend, #export
Resources/Views/base.leaf, Resources/Views/products.leaf, Resources/Views/product_form.leaf

✅ 4.0 wymaganie 3 – Należy stworzyć model Category i kontroler CategoryController z relacją
Sources/App/Models/Category.swift, Sources/App/Controllers/CategoryController.swift

❌ 4.5 wymaganie 4 – Należy zintegrować z Redis, zapamiętując np. ostatnio dodany lub oglądany produkt
(brakuje kodu Redis zapisu/odczytu w odpowiednim miejscu aplikacji)

❌ 5.0 wymaganie 5 – Należy przygotować wdrożenie na Heroku (obsługa PORT, Dockerfile, Procfile, GitHub + Heroku deploy)
(brakuje Dockerfile, Procfile, oraz instrukcji deploymentu)


# jeszcze trzeba dodać husky precommit
