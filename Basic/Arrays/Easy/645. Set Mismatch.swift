/*
You have a set of integers s, which originally contains all the numbers from 1 to n. Unfortunately, due to some error, one of the numbers in s got duplicated to another number in the set, which results in repetition of one number and loss of another number.

You are given an integer array nums representing the data status of this set after the error.

Find the number that occurs twice and the number that is missing and return them in the form of an array.

 

Example 1:

Input: nums = [1,2,2,4]
Output: [2,3]
Example 2:

Input: nums = [1,1]
Output: [1,2]
 

Constraints:

2 <= nums.length <= 104
1 <= nums[i] <= 104
*/

class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var result = [0,0]
        var hash = [Int:Int]() 
        var i = 0
        while i < nums.count {
            hash[nums[i], default: 0] += 1
            i += 1
        }

        i = 1
        while i <= nums.count {
            let count = hash[i] ?? 0
            if (count > 1){
                result[0] = i
            }
            if (count == 0) {
                result[1] = i
            }
            i += 1
        }
        return result
    }
}

let nums = [3,2,2]
let result = Solution().findErrorNums(nums)
print(result)