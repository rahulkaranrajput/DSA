/*
Given an integer n, return true if it is a power of four. Otherwise, return false.

An integer n is a power of four, if there exists an integer x such that n == 4x.

 

Example 1:

Input: n = 16
Output: true
Example 2:

Input: n = 5
Output: false
Example 3:

Input: n = 1
Output: true
 

Constraints:

-231 <= n <= 231 - 1
*/

class Solution {
    func check(_ n : Int, _ number: Int) -> Bool {
        if n < number {
            return false
        }
        if n == number {
            return true
        }
        return check(n, number * 4)
    }

    func isPowerOfFour(_ n: Int) -> Bool {
        if n < 1 {
            return false
        }
        if n == 1{
            return true
        }
        return check(n, 4)
    }
}

let n = 1
let result = Solution().isPowerOfFour(n)
print(result);