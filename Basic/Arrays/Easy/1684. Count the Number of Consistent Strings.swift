/*
You are given a string allowed consisting of distinct characters and an array of strings words. A string is consistent if all characters in the string appear in the string allowed.

Return the number of consistent strings in the array words.

 

Example 1:

Input: allowed = "ab", words = ["ad","bd","aaab","baa","badab"]
Output: 2
Explanation: Strings "aaab" and "baa" are consistent since they only contain characters 'a' and 'b'.
Example 2:

Input: allowed = "abc", words = ["a","b","c","ab","ac","bc","abc"]
Output: 7
Explanation: All strings are consistent.
Example 3:

Input: allowed = "cad", words = ["cc","acd","b","ba","bac","bad","ac","d"]
Output: 4
Explanation: Strings "cc", "acd", "ac", and "d" are consistent.
 

Constraints:

1 <= words.length <= 104
1 <= allowed.length <= 26
1 <= words[i].length <= 10
The characters in allowed are distinct.
words[i] and allowed contain only lowercase English letters.
*/

class Solution {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        let allowedSet = Set(allowed)
        var result = 0
        for word in words {
            var isAllowed = true
            for char in word {
                if !allowedSet.contains(char) {
                    isAllowed = false
                    break
                }
            }
            if isAllowed {
                result += 1
            }
        }
        return result
    }
}

class Solution2 {
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        // Step 1: Convert allowed letters into a bitmask
        var allowedMask = 0
        for char in allowed {
            let bit = 1 << (char.asciiValue! - Character("a").asciiValue!)
            print("bit",bit)
            allowedMask |= bit
            print("allowedMask1", allowedMask)
        }
        print("allowedMask2", allowedMask)
        // Step 2: Compare each word's characters using bitmask
        var result = 0
        for word in words {
            var wordMask = 0
            for char in word {
                let bit = 1 << (char.asciiValue! - Character("a").asciiValue!)
                wordMask |= bit
            }
            print("wordMask",wordMask)
            if (wordMask | allowedMask) == allowedMask {
                result += 1
            }
        }

        return result
    }
}

let allowed = "cad"
let words = ["cc","acd","b","ba","bac","bad","ac","d"]

let result = Solution2().countConsistentStrings(allowed, words)
print(result)