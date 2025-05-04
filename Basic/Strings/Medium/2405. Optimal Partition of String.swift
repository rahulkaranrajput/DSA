/*
Given a string s, partition the string into one or more substrings such that the characters in each substring are unique. That is, no letter appears in a single substring more than once.

Return the minimum number of substrings in such a partition.

Note that each character should belong to exactly one substring in a partition.

 

Example 1:

Input: s = "abacaba"
Output: 4
Explanation:
Two possible partitions are ("a","ba","cab","a") and ("ab","a","ca","ba").
It can be shown that 4 is the minimum number of substrings needed.
Example 2:

Input: s = "ssssss"
Output: 6
Explanation:
The only valid partition is ("s","s","s","s","s","s").
 

Constraints:

1 <= s.length <= 105
s consists of only English lowercase letters.
*/

class Solution {
    func partitionString(_ s: String) -> Int {
        var count = 0 
        var characterSet: Set<Character> = []
        for char in s {
            if characterSet.contains(char){
                count += 1
                characterSet.removeAll()
                characterSet.insert(char)
            } else {
                characterSet.insert(char)
            }
        }
        count += 1
        return count
    }
}

let s = "ssssss"

let result = Solution().partitionString(s)
print(result)