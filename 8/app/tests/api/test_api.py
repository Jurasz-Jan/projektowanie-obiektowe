import unittest
import requests

class APITest(unittest.TestCase):
    def test_api_hello_success(self):
        r = requests.get('http://localhost:5000/api/hello?name=Jan')
        self.assertEqual(r.status_code, 200)
        self.assertIn('Czesc, Jan!', r.text)

    def test_api_hello_empty(self):
        r = requests.get('http://localhost:5000/api/hello')
        self.assertEqual(r.status_code, 400)
        self.assertIn('error', r.text)

if __name__ == '__main__':
    unittest.main()