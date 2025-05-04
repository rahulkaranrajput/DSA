/*
You are given a string num representing a large integer. An integer is good if it meets the following conditions:

It is a substring of num with length 3.
It consists of only one unique digit.
Return the maximum good integer as a string or an empty string "" if no such integer exists.

Note:

A substring is a contiguous sequence of characters within a string.
There may be leading zeroes in num or a good integer.
 

Example 1:

Input: num = "6777133339"
Output: "777"
Explanation: There are two distinct good integers: "777" and "333".
"777" is the largest, so we return "777".
Example 2:

Input: num = "2300019"
Output: "000"
Explanation: "000" is the only good integer.
Example 3:

Input: num = "42352338"
Output: ""
Explanation: No substring of length 3 consists of only one unique digit. Therefore, there are no good integers.
 

Constraints:

3 <= num.length <= 1000
num only consists of digits.
*/

class Solution {
    func largestGoodInteger(_ num: String) -> String {
        var result = 0
        var currentChar: Character = "a"
        var largestString = ""
        var tempString = ""
        for char in num {
            if char == currentChar {
                tempString = tempString + "\(char)"
                if tempString.count == 3 {
                    if let value1 = Int(tempString) {
                        if value1 >= result {
                            result = value1
                            largestString = tempString
                        }
                    }
                }
            } else {
                currentChar = char
                tempString = "\(char)"
            }
        }
        return largestString
    }

    func largestGoodInteger2(_ num: String) -> String {
        let nums = Array(num)
        var largestString = ""
        var result = -1
        for i in stride(from : 0, through: (nums.count - 3), by: 1) {
            if (nums[i] == nums[i + 1]) && (nums[i] == nums[i + 2]) {
                let value = Int(nums[i].asciiValue!)
                if value > result {
                    result = value
                    largestString = "\(nums[i])" + "\(nums[i])" + "\(nums[i])"
                }
            }
        }
        return largestString
    }
}

let num = "222"
let result = Solution().largestGoodInteger2(num)
print(result)