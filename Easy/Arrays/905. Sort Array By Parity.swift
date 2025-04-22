/*
Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers.

Return any array that satisfies this condition.



Example 1:

Input: nums = [3,1,2,4]
Output: [2,4,3,1]
Explanation: The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
Example 2:

Input: nums = [0]
Output: [0]


Constraints:

1 <= nums.length <= 5000
0 <= nums[i] <= 5000

*/

class Solution {
  func sortArrayByParity(_ nums: [Int]) -> [Int] {
    var array = nums
    var left = 0
    var right = 0

    while right < array.count {
      if (array[right] % 2) == 0 {
        if left != right {
          array[left] = array[left] + array[right]
          array[right] = array[left] - array[right]
          array[left] = array[left] - array[right]
        }
        left += 1
      }
      right += 1
    }
    return array
  }
}

var nums = [0, 1, 2]

let array = Solution().sortArrayByParity(nums)
print(array)
