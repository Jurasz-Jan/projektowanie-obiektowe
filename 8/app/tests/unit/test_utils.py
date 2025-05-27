import unittest
from app.utils import format_name


class TestUtils(unittest.TestCase):
    def test_format_name_basic(self):
        self.assertEqual(format_name("jan"), "Jan")

    def test_format_name_whitespace(self):
        self.assertEqual(format_name("  jan "), "Jan")

    def test_format_name_empty(self):
        self.assertEqual(format_name(""), "Nieznajomy")

    def test_many_variations(self):
        names = [("anna", "Anna"), (" KATARZYNA", "Katarzyna"), ("", "Nieznajomy")] * 34
        for original, expected in names[:100]:
            self.assertEqual(format_name(original), expected)

if __name__ == '__main__':
    unittest.main()