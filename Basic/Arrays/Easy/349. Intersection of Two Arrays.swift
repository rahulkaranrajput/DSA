/*
Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.

 

Example 1:

Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2]
Example 2:

Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [9,4]
Explanation: [4,9] is also accepted.
 

Constraints:

1 <= nums1.length, nums2.length <= 1000
0 <= nums1[i], nums2[i] <= 1000
*/

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1Set = Set<Int>()
        var returnArray = [Int]()

        for value in nums1 {
            nums1Set.insert(value)
        }

        for value in nums2 {
            if nums1Set.contains(value) {
                returnArray.append(value)
                nums1Set.remove(value)
            }
        }
        return returnArray
    }
}

let nums1 = [4,9,5]
let nums2 = [9,4,9,8,4]

let result = Solution().intersection(nums1, nums2)
print("result", result)
