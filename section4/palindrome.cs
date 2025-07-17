using System;
using System.Text.RegularExpressions;

public class PalindromeChecker
{
    /// <summary>
    /// Checks if a string is a palindrome, ignoring spaces, punctuation, and case.
    /// </summary>
    /// <param name="value">The string to check</param>
    /// <returns>True if the string is a palindrome, false otherwise</returns>
    public bool CheckPalindrome(string value)
    {
        if (string.IsNullOrEmpty(value))
            return true;
        
        // Normalize the string: remove non-alphanumeric characters, convert to lowercase
        string normalized = Regex.Replace(value, @"[^a-zA-Z0-9]", "").ToLower();
        
        // Handle empty string after normalization
        if (string.IsNullOrEmpty(normalized))
            return true;
        
        return CheckPalindromeRecursive(normalized, 0, normalized.Length - 1);
    }

    private bool CheckPalindromeRecursive(string str, int left, int right)
    {
        // Base case: if pointers meet or cross, it's a palindrome
        if (left >= right)
            return true;
        
        // If characters don't match, it's not a palindrome
        if (str[left] != str[right])
            return false;
        
        // Recursively check the inner substring
        return CheckPalindromeRecursive(str, left + 1, right - 1);
    }
}