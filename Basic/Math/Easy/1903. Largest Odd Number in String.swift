/*
You are given a string num, representing a large integer. Return the largest-valued odd integer (as a string) that is a non-empty substring of num, or an empty string "" if no odd integer exists.

A substring is a contiguous sequence of characters within a string.

 

Example 1:

Input: num = "52"
Output: "5"
Explanation: The only non-empty substrings are "5", "2", and "52". "5" is the only odd number.
Example 2:

Input: num = "4206"
Output: ""
Explanation: There are no odd numbers in "4206".
Example 3:

Input: num = "35427"
Output: "35427"
Explanation: "35427" is already an odd number.
 

Constraints:

1 <= num.length <= 105
num only consists of digits and does not contain any leading zeros.
*/

class Solution {
    func largestOddNumber(_ num: String) -> String {
        let words = Array(num)
        var i = words.count - 1
        while i >= 0{
            if let num = Int("\(words[i])") {
                if (num % 2) != 0 {
                    break
                }
            }
            i -= 1
        }
        if i < 0 {
            return ""
        }
        var j = 0
        var oddnumber = ""
        while j <= i {
            oddnumber = oddnumber + "\(words[j])"
            j += 1
        }
        return oddnumber
    }

    func largestOddNumber2(_ num: String) -> String {
        for i in stride(from: num.count - 1, through: 0, by: -1) {
            let index = num.index(num.startIndex, offsetBy: i)
            if let digit = num[index].wholeNumberValue, digit % 2 == 1 {
                return String(num[..<num.index(after: index)])
            }
        }
        return ""
    }
}

let n = "35427"
let result = Solution().largestOddNumber2(n)
print(result)
