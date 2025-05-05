/*

Given an array of integers nums, return the number of good pairs.

A pair (i, j) is called good if nums[i] == nums[j] and i < j.

 

Example 1:

Input: nums = [1,2,3,1,1,3]
Output: 4
Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
Example 2:

Input: nums = [1,1,1,1]
Output: 6
Explanation: Each pair in the array are good.
Example 3:

Input: nums = [1,2,3]
Output: 0

*/

class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        var count = 0
        for num in nums {
            if let freq = map[num] {
                count += freq
                map[num] = freq + 1
            } else {
                map[num] = 1
            }
        }
        return count
    }
}

var nums = [1,2,3,1,1,3]

let result = Solution().numIdenticalPairs(nums)
print(result)