/*
You are given an n x n integer matrix grid.

Generate an integer matrix maxLocal of size (n - 2) x (n - 2) such that:

maxLocal[i][j] is equal to the largest value of the 3 x 3 matrix in grid centered around row i + 1 and column j + 1.
In other words, we want to find the largest value in every contiguous 3 x 3 matrix in grid.

Return the generated matrix.

 

Example 1:


Input: grid = [[9,9,8,1],[5,6,2,6],[8,2,6,4],[6,2,2,2]]
Output: [[9,9],[8,6]]
Explanation: The diagram above shows the original matrix and the generated matrix.
Notice that each value in the generated matrix corresponds to the largest value of a contiguous 3 x 3 matrix in grid.
9981
5626
8264
6222
Example 2:


Input: grid = [[1,1,1,1,1],[1,1,1,1,1],[1,1,2,1,1],[1,1,1,1,1],[1,1,1,1,1]]
Output: [[2,2,2],[2,2,2],[2,2,2]]
Explanation: Notice that the 2 is contained within every contiguous 3 x 3 matrix in grid.
 

Constraints:

n == grid.length == grid[i].length
3 <= n <= 100
1 <= grid[i][j] <= 100
*/

class Solution {
    func largestLocal(_ grid: [[Int]]) -> [[Int]] {
        let size = grid.count - 2
        var smallArray = Array(repeating: Array(repeating: 0, count: size), count: size)

        var i = 0
        while i < size {
            var j = 0
            while j < size {
                var row = i
                let rowSize = row + 3
                while row < rowSize {
                    var col = j
                    let colSize = col + 3                    
                    while col < colSize {
                        if smallArray[i][j] < grid[row][col] {
                            smallArray[i][j] = grid[row][col]
                        }
                        col += 1
                    }
                    row += 1
                }
                 j += 1
            }
            i += 1
        }
        return smallArray
    }
}

let grid = [[1,1,1,1,1],[1,1,1,1,1],[1,1,2,1,1],[1,1,1,1,1],[1,1,1,1,1]]

let result = Solution().largestLocal(grid)
print(result)