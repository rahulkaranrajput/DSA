/*

Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.

Note that after backspacing an empty text, the text will continue empty.

 

Example 1:

Input: s = "ab#c", t = "ad#c"
Output: true
Explanation: Both s and t become "ac".
Example 2:

Input: s = "ab##", t = "c#d#"
Output: true
Explanation: Both s and t become "".
Example 3:

Input: s = "a#c", t = "b"
Output: false
Explanation: s becomes "c" while t becomes "b".
 

Constraints:

1 <= s.length, t.length <= 200
s and t only contain lowercase letters and '#' characters.

*/

class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        let firstString = Array(s)
        let secondString = Array(t)
        var tempArrayFirst: [Character] = []
        var tempArraySecond: [Character] = []
        for char in firstString {
            if char == "#" {
                if tempArrayFirst.count > 0 {
                    tempArrayFirst.removeLast()
                }
            } else {
                tempArrayFirst.append(char)
            }
        }
        for char in secondString {
            if char == "#" {
                if tempArraySecond.count > 0 {
                    tempArraySecond.removeLast()
                }
            } else {
                tempArraySecond.append(char)
            }
        }
        return tempArrayFirst == tempArraySecond
    }

    func backspaceCompare2(_ s: String, _ t: String) -> Bool {
        func validCharacter(s: [Character], index: Int) -> Int {
            var tempIndex = index
            var backspace == 0
            while tempIndex >= 0 {
                if backspace == 0 && s[tempIndex] != "#" {
                    return tempIndex
                } else if s[tempIndex] == "#" {
                    backspace += 1
                } else {
                    backspace -= 1
                }
            }


        }
    }

    func backspaceCompare4(_ s: String, _ t: String) -> Bool {
        func build(_ str: String) -> String {
            var result = [Character]()
            for char in str {
                if char == "#" {
                    if !result.isEmpty {
                        result.removeLast()
                    }
                } else {
                    result.append(char)
                }
            }
            return String(result)
        }
        return build(s) == build(t)
    }
}

var s = "ab##"
var t = "c#d#"

let result = Solution().backspaceCompare3(s,t)
print(result)
