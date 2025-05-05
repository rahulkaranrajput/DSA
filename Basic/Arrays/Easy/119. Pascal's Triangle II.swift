/*
Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.

In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

Example 1:

Input: rowIndex = 3
Output: [1,3,3,1]
Example 2:

Input: rowIndex = 0
Output: [1]
Example 3:

Input: rowIndex = 1
Output: [1,1]
 

Constraints:

0 <= rowIndex <= 33

*/

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var row = [1]
        guard rowIndex > 0 else {
            return row
        }
        for i in 1...rowIndex {
            for j in (1..<i).reversed() {
                row[j] = row[j] + row[j - 1]
            }
            row.append(1)
        }
        return row
    }
}

var rowIndex = 0
let result = Solution().getRow(rowIndex)
print(result)