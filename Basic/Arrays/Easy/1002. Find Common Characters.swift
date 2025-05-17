/*
Given a string array words, return an array of all characters that show up in all strings within the words (including duplicates). You may return the answer in any order.

 

Example 1:

Input: words = ["bella","label","roller"]
Output: ["e","l","l"]
Example 2:

Input: words = ["cool","lock","cook"]
Output: ["c","o"]
 

Constraints:

1 <= words.length <= 100
1 <= words[i].length <= 100
words[i] consists of lowercase English letters.
*/

class Solution {
    func commonChars(_ words: [String]) -> [String] {
        var hashMap1 = [Character: Int]()
        for char in words[0] {
            hashMap1[char, default: 0] += 1
        }
        for word in words {
            var hashMap2 = [Character: Int]()
            for char in word {
                hashMap2[char, default: 0] += 1
            }
            for (key, value) in hashMap1 {
                hashMap1[key] = min(value, (hashMap2[key] ?? 0))
            }
        }
        var result = [String]()
        for (key, value) in hashMap1{
            var i = 0
            while i<value {
                result.append("\(key)")
                i += 1
            }
        }
        return result
    }
}

let words = ["cool","lock","cook"]
let result = Solution().commonChars(words)
print(result)