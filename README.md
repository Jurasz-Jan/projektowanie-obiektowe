Jeszcze muszę pamiętać o husky precommit

# Zadanie 1 Paradygmaty
✅ 3.0 Procedura do generowania 50 losowych liczb od 0 do 100
✅ 3.5 Procedura do sortowania liczb
✅ 4.0 Dodanie parametrów do procedury losującej określającymi zakres
✅ losowania: od, do, ile
✅ 4.5 5 testów jednostkowych testujące procedury
❌ 5.0  


# Zadanie 2 Symfony CRUD

Zadanie 1 – Symfony CRUD dla Produktów

✅ 3.0 wymaganie 1 – src/Entity/Product.php, c
✅ 3.5 wymaganie 2 – src/Controller/ProductController.php, templates/product/
✅ 4.0 wymaganie 3 – src/Controller/ProductApiController.php
❌ 4.5 wymaganie 4 
❌ 5.0 wymaganie 5 

Kod: projektowanie-obiektowe/2

Kod: (folder lub branch)


# Zadanie 3 Wzorce kreacyjne Spring Boot (Kotlin)

✅ 3.0 wymaganie 1 – Należy stworzyć jeden kontroler wraz z danymi wyświetlanymi z listy na endpoint’cie w formacie JSON  
`main/kotlin/com/example/demo/controller/DataController.kt`

✅ 3.5 wymaganie 2 – Należy stworzyć klasę do autoryzacji (mock) jako Singleton w formie eager  
`main/kotlin/com/example/demo/service/EagerAuthService.kt`

✅ 4.0 wymaganie 3 – Należy obsłużyć dane autoryzacji przekazywane przez użytkownika  
`main/kotlin/com/example/demo/controller/AuthController.kt`  
`main/kotlin/com/example/demo/model/user.kt`

❌ 4.5 wymaganie 4 – Należy wstrzyknąć singleton do głównej klasy via @Autowired  
`main/kotlin/com/example/demo/controller/AuthController.kt` 

❌ 5.0 wymaganie 5 – Obok wersji Eager do wyboru powinna być wersja Singletona w wersji lazy  
`main/kotlin/com/example/demo/controller/LazyAuthController.kt` 

Kod: `projektowanie-obiektowe/3/demo/src`




# Zadanie 4 Echo-gorm

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


# Zadanie 5 – React App: Sklep z koszykiem, kategoriami i płatnością

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



# Zadanie 6 Zapaszki (Sonar + ESLint)

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


# Zadanie 7 Antywzorce (Vapor)

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

# ✅ Zadanie 8 – Testy aplikacji (Unit, API, WebDriver)
📁 Kod projektu:
projektowanie-obiektowe/8

✅ 3.0 wymaganie 1 – Testy jednostkowe
Pliki:
app/tests/unit/test_utils.py, docker-compose.yml, Dockerfile

✅ 3.5 wymaganie 2 – Testy API
Pliki:
app/tests/api/test_api.py

✅ 4.0 wymaganie 3 – Testy WebDriver (UI)
Pliki:
app/tests/webdriver/test_ui.py

❌ 4.5 wymaganie 4 – Negatywne testy API dla błędnych danych
Do zrobienia:
Rozszerzenie testów API o przypadki błędnych danych (np. nieobsługiwany format, brak parametrów, złe metody HTTP).

❌ 5.0 wymaganie 5 – Uruchamianie testów automatycznie przez Docker / BrowserStack


# Zadanie 9 Mobile First (Android)
✅ 3.0 wymaganie 1 – Produkt i Kategorie
Utworzono aplikację Android w Kotlinie z dwoma ekranami: listą kategorii oraz listą produktów przypisanych do kategorii. Użyto RecyclerView, AppCompatActivity, przekazywanie Intent.
Link do commita: (26a893edd65709e3468990dea3e5c08b5079d896)

❌ 3.5 wymaganie 2
❌ 4.0 wymaganie 3
❌ 4.5 wymaganie 4
❌ 5.0 wymaganie 5
