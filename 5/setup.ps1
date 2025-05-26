$basePath = ".\5"
$componentsPath = "$basePath\src\components"

$folders = @(
    "$basePath",
    "$basePath\src",
    $componentsPath
)

$files = @{
    "$basePath\Dockerfile" = @"
FROM node:20
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]
"@;

    "$basePath\docker-compose.yml" = @"
version: "3"
services:
  frontend:
    build: .
    ports:
      - "3000:3000"
    volumes:
      - .:/app
    environment:
      - CHOKIDAR_USEPOLLING=true
    command: npm start

  backend:
    image: json-server
    ports:
      - "3001:80"
    volumes:
      - ./db.json:/data/db.json
    command: json-server --watch /data/db.json --port 80
"@;

    "$basePath\package.json" = @"
{
  "name": "react-behavioral-patterns",
  "version": "1.0.0",
  "scripts": {
    "start": "react-scripts start"
  },
  "dependencies": {
    "axios": "^1.6.0",
    "react": "^18.0.0",
    "react-dom": "^18.0.0",
    "react-router-dom": "^6.3.0"
  }
}
"@;

    "$basePath\src\index.tsx" = @"
import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";

const root = ReactDOM.createRoot(document.getElementById("root")!);
root.render(<App />);
"@;

    "$basePath\src\App.tsx" = @"
import { BrowserRouter as Router, Route, Routes, Link } from "react-router-dom";
import Products from "./components/Products";
import Payments from "./components/Payments";
import Cart from "./components/Cart";
import { AppProvider } from "./context";

export default function App() {
  return (
    <AppProvider>
      <Router>
        <nav>
          <Link to="/">Products</Link> | <Link to="/cart">Cart</Link> | <Link to="/pay">Pay</Link>
        </nav>
        <Routes>
          <Route path="/" element={<Products />} />
          <Route path="/cart" element={<Cart />} />
          <Route path="/pay" element={<Payments />} />
        </Routes>
      </Router>
    </AppProvider>
  );
}
"@;

    "$basePath\src\context.tsx" = @"
import { createContext, useState } from "react";

export const AppContext = createContext(null);

export function AppProvider({ children }) {
  const [cart, setCart] = useState([]);
  return (
    <AppContext.Provider value={{ cart, setCart }}>
      {children}
    </AppContext.Provider>
  );
}
"@;

    "$componentsPath\Products.tsx" = @"
import { useEffect, useState, useContext } from "react";
import axios from "axios";
import { AppContext } from "../context";

export default function Products() {
  const { cart, setCart } = useContext(AppContext);
  const [products, setProducts] = useState([]);

  useEffect(() => {
    axios.get("http://localhost:3001/products").then((res) => setProducts(res.data));
  }, []);

  return (
    <div>
      {products.map((p) => (
        <div key={p.id}>
          {p.name} <button onClick={() => setCart([...cart, p])}>Add</button>
        </div>
      ))}
    </div>
  );
}
"@;

    "$componentsPath\Payments.tsx" = @"
import { useContext } from "react";
import axios from "axios";
import { AppContext } from "../context";

export default function Payments() {
  const { cart } = useContext(AppContext);

  const sendOrder = () => {
    axios.post("http://localhost:3001/orders", cart);
  };

  return <button onClick={sendOrder}>Send Payment</button>;
}
"@;

    "$componentsPath\Cart.tsx" = @"
import { useContext } from "react";
import { AppContext } from "../context";

export default function Cart() {
  const { cart } = useContext(AppContext);
  return <ul>{cart.map((item, i) => <li key={i}>{item.name}</li>)}</ul>;
}
"@
}

# Tworzenie folderów
foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
    }
}

# Tworzenie plików z zawartością
foreach ($path in $files.Keys) {
    $content = $files[$path]
    Set-Content -Path $path -Value $content -Encoding UTF8
}

Write-Host "✅ Struktura projektu utworzona z zawartością plików." -ForegroundColor Green
