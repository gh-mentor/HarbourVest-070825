import string

class WordMix:
    @staticmethod
    def palindrome(s: str) -> bool:
        """
        Returns True if the string is a palindrome (case-insensitive, ignores spaces and punctuation).
        """
        cleaned = ''.join(c.lower() for c in s if c.isalnum())
        return cleaned == cleaned[::-1]