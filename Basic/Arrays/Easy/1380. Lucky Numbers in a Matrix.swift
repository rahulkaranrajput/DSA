/*
Given an m x n matrix of distinct numbers, return all lucky numbers in the matrix in any order.

A lucky number is an element of the matrix such that it is the minimum element in its row and maximum in its column.

 

Example 1:

Input: matrix = [[3,7,8],[9,11,13],[15,16,17]]
Output: [15]
Explanation: 15 is the only lucky number since it is the minimum in its row and the maximum in its column.
Example 2:

Input: matrix = [[1,10,4,2],
                 [9,3,8,7],
                 [15,16,17,12]
                ]
Output: [12]
Explanation: 12 is the only lucky number since it is the minimum in its row and the maximum in its column.
Example 3:

Input: matrix = [[7,8],[1,2]]
Output: [7]
Explanation: 7 is the only lucky number since it is the minimum in its row and the maximum in its column.
 

Constraints:

m == mat.length
n == mat[i].length
1 <= n, m <= 50
1 <= matrix[i][j] <= 105.
All elements in the matrix are distinct.
*/

class Solution {
    func luckyNumbers(_ matrix: [[Int]]) -> [Int] {
        var maxSet = Set<Int>()
        var minSet = Set<Int>()
        var row = 0
        var col = 0
        while row < matrix.count {
            col = 0
            var min = Int.max
            while col < matrix[row].count {
                if matrix[row][col] < min {
                    min = matrix[row][col]
                }
                col += 1
            }
            minSet.insert(min)
            row += 1
        }

        row = 0
        col = 0
         while col < matrix[0].count {
            row = 0
            var max = 0
            while row < matrix.count {
                if matrix[row][col] > max {
                    max = matrix[row][col]
                }
                row += 1
            }
            maxSet.insert(max)
            col += 1
        }

        let intersection = maxSet.intersection(minSet)

        return Array(intersection)
    }
}

let matrix = [[7,8],[1,2]]
let result = Solution().luckyNumbers(matrix)
print(result)