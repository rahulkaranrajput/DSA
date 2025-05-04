/*
Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

 

Example 1:

Input: s = "Let's take LeetCode contest"
Output: "s'teL ekat edoCteeL tsetnoc"
Example 2:

Input: s = "Mr Ding"
Output: "rM gniD"
 

Constraints:

1 <= s.length <= 5 * 104
s contains printable ASCII characters.
s does not contain any leading or trailing spaces.
There is at least one word in s.
All the words in s are separated by a single space.
*/

class Solution {
    func reverseWords(_ s: String) -> String {
        var chars = Array(s)
        var start = 0

        for i in 0...chars.count {
            if i == chars.count || chars[i] == " " {
                reverse(&chars, start, i - 1)
                start = i + 1
            }
        }
        return String(chars)
    }

    private func reverse(_ chars: inout [Character], _ left: Int, _ right: Int){
        var l = left
        var r = right
        while l < r {
            chars.swapAt(l, r)
            l += 1
            r -= 1
        }
    }
}


var s = "Let's take LeetCode contest"
let result = Solution().reverseWords(s)
print("reult", result)