/*
Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome.

 

Example 1:

Input: s = "abccccdd"
Output: 7
Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
Example 2:

Input: s = "a"
Output: 1
Explanation: The longest palindrome that can be built is "a", whose length is 1.
 

Constraints:

1 <= s.length <= 2000
s consists of lowercase and/or uppercase English letters only.
*/

class Solution {
    func longestPalindrome(_ s: String) -> Int {
       var result = 0
       var hashMap = [Character: Int]()

       for char in s {
            hashMap[char, default: 0] += 1
            if let count = hashMap[char], count % 2 == 0 {
                result += 2
            }
       }

       for (_,value) in hashMap {
        if value % 2 != 0 {
            result += 1
            break
        }
       }
       return result
    }
}

class Solution2 {
    func longestPalindrome(_ s: String) -> Int {
       var result = 0
       var hashSet = Set<Character>()

       for char in s {
            if hashSet.contains(char) {
                hashSet.remove(char)
                result += 2
            } else {
                hashSet.insert(char)
            }
       }

       if hashSet.count > 0{
            result += 1
       }
       return result
    }
}

let s = "abccccdd"
let result = Solution().longestPalindrome(s)

print(result)
