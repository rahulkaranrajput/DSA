/*
Given an integer n, return true if it is a power of two. Otherwise, return false.

An integer n is a power of two, if there exists an integer x such that n == 2x.

 

Example 1:

Input: n = 1
Output: true
Explanation: 20 = 1
Example 2:

Input: n = 16
Output: true
Explanation: 24 = 16
Example 3:

Input: n = 3
Output: false
 

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
        return check(n, number * 2)
    }

    func isPowerOfFour(_ n: Int) -> Bool {
        if n < 1 {
            return false
        }
        if n == 1{
            return true
        }
        return check(n, 2)
    }
}

class Solution2 {
    func isPowerOfTwo(_ n: Int) -> Bool {
      return n > 0 && (((1 << 31) % n) == 0)
    }
}

let n = 3
let result = Solution().isPowerOfFour(n)
print(result);