/*
You are given an array of strings words and a string chars.

A string is good if it can be formed by characters from chars (each character can only be used once).

Return the sum of lengths of all good strings in words.

 

Example 1:

Input: words = ["cat","bt","hat","tree"], chars = "atach"
Output: 6
Explanation: The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.
Example 2:

Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
Output: 10
Explanation: The strings that can be formed are "hello" and "world" so the answer is 5 + 5 = 10.
 

Constraints:

1 <= words.length <= 1000
1 <= words[i].length, chars.length <= 100
words[i] and chars consist of lowercase English letters.
*/

class Solution {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var hashMap = [Character: Int]()
        var result = 0
        for char in chars {
            hashMap[char] = (hashMap[char] ?? 0) + 1
        }

        for w1 in words {
            let word = Array(w1)
            var temphash = hashMap
            var i = 0
            while i < word.count {
                let char = word[i]
                if let count = temphash[char]{
                    if count <= 0 {
                        break
                    }
                    temphash[char] = count - 1
                } else {
                    break
                }
               i += 1
            }
             if i == w1.count {
                    result = w1.count + result
            }
        }
        return result
    }
}

let words = ["hello","world","leetcode"]
let chars = "welldonehoneyr"

let result = Solution().countCharacters(words, chars)
print(result);