/*
Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.


Example 1:

Input: s = "leetcode"

Output: 0

Explanation:

The character 'l' at index 0 is the first character that does not occur at any other index.

Example 2:

Input: s = "loveleetcode"

Output: 2

Example 3:

Input: s = "aabb"

Output: -1

Constraints:

1 <= s.length <= 105
s consists of only lowercase English letters.
*/

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var hash = [Character:Int]()

        for char in s {
            hash[char, default: 0] += 1
        }    
        var i = 0
        for char in s {
            if hash[char] == 1{
                return i
            }
            i += 1
        }    
        return -1
    }
}

let s = "aabb"
let result = Solution().firstUniqChar(s)
print("result", result)