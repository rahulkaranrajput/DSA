/*
Given a valid parentheses string s, return the nesting depth of s. The nesting depth is the maximum number of nested parentheses.

 

Example 1:

Input: s = "(1+(2*3)+((8)/4))+1"

Output: 3

Explanation:

Digit 8 is inside of 3 nested parentheses in the string.

Example 2:

Input: s = "(1)+((2))+(((3)))"

Output: 3

Explanation:

Digit 3 is inside of 3 nested parentheses in the string.

Example 3:

Input: s = "()(())((()()))"

Output: 3

 

Constraints:

1 <= s.length <= 100
s consists of digits 0-9 and characters '+', '-', '*', '/', '(', and ')'.
It is guaranteed that parentheses expression s is a VPS.
*/


class Solution {
    func maxDepth(_ s: String) -> Int {
        var count = 0
        var stack = [Character]()

        for char in s{
            if char == "("{
                stack.append("(")
                count = max(count, stack.count)
            } else if char == ")"{
                stack.removeLast()
            }
        }
        return count
    }
}

let s = "(1+(2*3)+((8)/4))+1"

let result = Solution().maxDepth(s);

print("result", result)