import unittest
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.common.exceptions import WebDriverException

class UITests(unittest.TestCase):
    def setUp(self):
        options = webdriver.ChromeOptions()
        options.add_argument("--headless")
        options.add_argument("--no-sandbox")
        options.add_argument("--disable-dev-shm-usage")
        try:
            self.driver = webdriver.Chrome(service=Service(), options=options)
        except WebDriverException as e:
            self.fail(f"Nie udało się uruchomic ChromeDrivera: {e}")
        self.driver.set_page_load_timeout(10)
        self.driver.get("http://localhost:5000")

    def test_page_title_and_form(self):
        self.assertIn("Formularz", self.driver.page_source)
        self.assertTrue(self.driver.find_element(By.NAME, "name"))

    def test_form_submission(self):
        input_field = self.driver.find_element(By.NAME, "name")
        input_field.send_keys("jan")
        input_field.submit()
        time.sleep(0.5)  # dla pewnosci, aż strona się przeładuje
        self.assertIn("Czesc, Jan!", self.driver.page_source)

    def test_multiple_names(self):
        for name in ["ania", "KUBA", "  marek  ", ""]:
            self.driver.get("http://localhost:5000")
            input_field = self.driver.find_element(By.NAME, "name")
            input_field.clear()
            input_field.send_keys(name)
            input_field.submit()
            time.sleep(0.5)
            if name.strip() == "":
                self.assertIn("Czesc, Nieznajomy!", self.driver.page_source)
            else:
                expected = name.strip().capitalize()
                self.assertIn(f"Czesc, {expected}!", self.driver.page_source)

    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    unittest.main()
