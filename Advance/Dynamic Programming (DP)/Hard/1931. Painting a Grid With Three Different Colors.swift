/*
You are given two integers m and n. Consider an m x n grid where each cell is initially white. You can paint each cell red, green, or blue. All cells must be painted.

Return the number of ways to color the grid with no two adjacent cells having the same color. Since the answer can be very large, return it modulo 109 + 7.

 

Example 1:


Input: m = 1, n = 1
Output: 3
Explanation: The three possible colorings are shown in the image above.
Example 2:


Input: m = 1, n = 2
Output: 6
Explanation: The six possible colorings are shown in the image above.
Example 3:

Input: m = 5, n = 5
Output: 580986
 

Constraints:

1 <= m <= 5
1 <= n <= 1000
*/

import Foundation

class Solution {
    let MOD = 1_000_000_007

    func colorTheGrid(_ m: Int, _ n: Int) -> Int {
        var validStates = [[Int]]()

        func dfs(_ pos: Int, _ state: [Int]) {
            if pos == m {
                validStates.append(state)
                return
            }
            for color in 0..<3 {
                if pos == 0 || state[pos - 1] != color {
                    dfs(pos + 1, state + [color])
                }
            }
        }
        
        dfs(0, [])

        let k = validStates.count
        var transitions = [[Int]](repeating: [], count: k)

        for i in 0..<k {
            for j in 0..<k {
                var ok = true
                for row in 0..<m {
                    if validStates[i][row] == validStates[j][row] {
                        ok = false
                        break
                    }
                }
                if ok {
                    transitions[i].append(j)
                     
                }
            }
        }

        var dp = [Int](repeating: 1, count: k) 
        for _ in 1..<n {
            var newDp = [Int](repeating: 0, count: k)
            for i in 0..<k {
                for j in transitions[i] {
                    newDp[j] = (newDp[j] + dp[i]) % MOD
                }
            }
            dp = newDp
        }

        return dp.reduce(0) { ($0 + $1) % MOD }
    }
}



let m = 3
let n = 3

let result = Solution().colorTheGrid(m,n)
print(result)