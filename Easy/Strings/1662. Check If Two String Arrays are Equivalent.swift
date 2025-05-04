/*
Given two string arrays word1 and word2, return true if the two arrays represent the same string, and false otherwise.

A string is represented by an array if the array elements concatenated in order forms the string.

 

Example 1:

Input: word1 = ["ab", "c"], word2 = ["a", "bc"]
Output: true
Explanation:
word1 represents string "ab" + "c" -> "abc"
word2 represents string "a" + "bc" -> "abc"
The strings are the same, so return true.
Example 2:

Input: word1 = ["a", "cb"], word2 = ["ab", "c"]
Output: false
Example 3:

Input: word1  = ["abc", "d", "defg"], word2 = ["abcddefg"]
Output: true
 

Constraints:

1 <= word1.length, word2.length <= 103
1 <= word1[i].length, word2[i].length <= 103
1 <= sum(word1[i].length), sum(word2[i].length) <= 103
word1[i] and word2[i] consist of lowercase letters.
*/

class Solution {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        var text1 = ""
        var text2 = ""
        for text in word1 {
            text1 = text1 + text 
        }
        for text in word2 {
            text2 = text2 + text 
        }

        return text1 == text2
    }

    func arrayStringsAreEqual2(_ word1: [String], _ word2: [String]) -> Bool {
        var i = 0, j = 0
        var p1 = 0, p2 = 0

        while i < word1.count && j < word2.count {
            let w1 = Array(word1[i])
            let w2 = Array(word2[j])
        
            if w1[p1] != w2[p2] {
                return false
            }

            p1 += 1
            if p1 == w1.count {
                i += 1
                p1 = 0
            }

            p2 += 1
            if p2 == w2.count {
                j += 1
                p2 = 0
            }
        }

        return i == word1.count && j == word2.count
    }

}

let word1 = ["abc", "d", "defg"] 
let word2 = ["abcddefg"]

let result = Solution().arrayStringsAreEqual2(word1, word2)
print(result);