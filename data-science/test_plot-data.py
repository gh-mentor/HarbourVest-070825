import pytest
import string

class WordMix:
    @staticmethod
    def palindrome(s: str) -> bool:
        # Remove spaces and punctuation, and convert to lowercase
        cleaned = ''.join(
            c.lower() for c in s if c.isalnum()
        )
        return cleaned == cleaned[::-1]

def test_palindrome_true():
    assert WordMix.palindrome("bob") is True
    assert WordMix.palindrome("kayak") is True
    assert WordMix.palindrome("Bob") is True
    assert WordMix.palindrome("A man, a plan, a canal: Panama") is True

def test_palindrome_false():
    assert WordMix.palindrome("boat") is False
    assert WordMix.palindrome("horse") is False
    assert WordMix.palindrome("car") is False
    assert WordMix.palindrome("Python!") is False