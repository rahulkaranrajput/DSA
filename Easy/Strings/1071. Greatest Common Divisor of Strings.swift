/*

For two strings s and t, we say "t divides s" if and only if s = t + t + t + ... + t + t (i.e., t is concatenated with itself one or more times).

Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.

 

Example 1:

Input: str1 = "ABCABC", str2 = "ABC"
Output: "ABC"
Example 2:

Input: str1 = "ABABAB", str2 = "ABAB"
Output: "AB"
Example 3:

Input: str1 = "LEET", str2 = "CODE"
Output: ""

*/

class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
       if str1 + str2 != str2 + str1 {
            return ""
        }

        func gcd(_ a: Int, _ b: Int) -> Int {
            return b == 0 ? a : gcd(b, a % b)
        }

        let len = gcd(str1.count, str2.count)
        let endIndex = str1.index(str1.startIndex, offsetBy: len)
        return String(str1[str1.startIndex..<endIndex])
    }
}