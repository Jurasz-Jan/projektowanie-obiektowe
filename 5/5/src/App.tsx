import React, { useEffect, useState, createContext, useContext } from "react";
import axios from "axios";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Link,
  useNavigate,
} from "react-router-dom";

type Product = { id: number; name: string; categoryId: number };
type Category = { id: number; name: string };
type AppContextType = {
  cart: Product[];
  setCart: React.Dispatch<React.SetStateAction<Product[]>>;
};

const AppContext = createContext<AppContextType | undefined>(undefined);

function useAppContext() {
  const ctx = useContext(AppContext);
  if (!ctx) throw new Error("useAppContext must be used inside provider");
  return ctx;
}

function Products() {
  const [products, setProducts] = useState<Product[]>([]);
  const [categories, setCategories] = useState<Category[]>([]);
  const { cart, setCart } = useAppContext();
  

  useEffect(() => {
    axios.get("http://localhost:3001/products").then((res) => setProducts(res.data));
    axios.get("http://localhost:3001/categories").then((res) => setCategories(res.data));
  }, []);

  const getCategoryName = (categoryId: number) => {
    const cat = categories.find(c => c.id === categoryId);
    return cat ? cat.name : "Unknown";
  };

  return (
    <div>
      <h2>Products</h2>
      {products.map((p) => (
        <div key={p.id}>
          {p.name} ({getCategoryName(p.categoryId)}){" "}
          <button onClick={() => setCart([...cart, p])}>Add</button>
        </div>
      ))}
    </div>
  );
}

function Cart() {
  const { cart } = useAppContext();
  return (
    <div>
      <h2>Cart</h2>
      <ul>{cart.map((item, i) => <li key={item.id}>{item.name}</li>)}</ul>
      <Payments />
    </div>
  );
}

function Payments() {
  const { cart, setCart } = useAppContext();
  const [message, setMessage] = useState("");
  const navigate = useNavigate();

  const sendOrder = () => {
    if (cart.length === 0) {
      setMessage("Cart is empty!");
      return;
    }

    axios.post("http://localhost:3001/orders", cart).then(() => {
      setCart([]);
      setMessage("✅ Order sent!");
      setTimeout(() => {
        setMessage("");
        navigate("/");
      }, 2000);
    });
  };

  return (
    <>
      <button onClick={sendOrder}>Send Payment</button>
      {message && <p>{message}</p>}
    </>
  );
}

export default function App() {
  const [cart, setCart] = useState<Product[]>([]);
  const contextValue = useMemo(() => ({ cart, setCart }), [cart]);

  return (
    <AppContext.Provider value={contextValue}>
      <Router>
        <h1>Simple Shop</h1>
        <nav>
          <Link to="/">Products</Link> | <Link to="/cart">Cart ({cart.length})</Link>
        </nav>
        <Routes>
          <Route path="/" element={<Products />} />
          <Route path="/cart" element={<Cart />} />
        </Routes>
      </Router>
    </AppContext.Provider>
  );
}
