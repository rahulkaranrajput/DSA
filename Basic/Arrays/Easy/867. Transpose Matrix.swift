/*
Given a 2D integer array matrix, return the transpose of matrix.

The transpose of a matrix is the matrix flipped over its main diagonal, switching the matrix's row and column indices.



 

Example 1:

Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[1,4,7],[2,5,8],[3,6,9]]
Example 2:

Input: matrix = [[1,2,3],[4,5,6]]
Output: [[1,4],[2,5],[3,6]]
 

Constraints:

m == matrix.length
n == matrix[i].length
1 <= m, n <= 1000
1 <= m * n <= 105
-109 <= matrix[i][j] <= 109
*/

class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let row = matrix.count
        let column = matrix.first!.count
        var result = Array(repeating: Array(repeating: 0, count: row), count: column)
        var i = 0, j = 0
        while i < row {
            while j < column {
                result[j][i] = matrix[i][j]
                j += 1
            }
            i += 1
            j = 0
        }
        return result
    }
}

let matrix = [[1,2,3],[4,5,6]]
let result = Solution().transpose(matrix)
print(result)