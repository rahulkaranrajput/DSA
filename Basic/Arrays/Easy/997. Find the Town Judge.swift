/*
In a town, there are n people labeled from 1 to n. There is a rumor that one of these people is secretly the town judge.

If the town judge exists, then:

The town judge trusts nobody.
Everybody (except for the town judge) trusts the town judge.
There is exactly one person that satisfies properties 1 and 2.
You are given an array trust where trust[i] = [ai, bi] representing that the person labeled ai trusts the person labeled bi. If a trust relationship does not exist in trust array, then such a trust relationship does not exist.

Return the label of the town judge if the town judge exists and can be identified, or return -1 otherwise.

 

Example 1:

Input: n = 2, trust = [[1,2]]
Output: 2
Example 2:

Input: n = 3, trust = [[1,3],[2,3]]
Output: 3
Example 3:

Input: n = 3, trust = [[1,3],[2,3],[3,1]]
Output: -1
 

Constraints:

1 <= n <= 1000
0 <= trust.length <= 104
trust[i].length == 2
All the pairs of trust are unique.
ai != bi
1 <= ai, bi <= n
*/

class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {

        var incomingNodes = [Int: Int]()
        var outGoingNodes = [Int: Int]()

        for edge in trust {
            if edge.count == 2{
                let firstPerson = edge[0]
                let secondPerson = edge[1] 
                incomingNodes[secondPerson, default : 0] += 1
                outGoingNodes[firstPerson, default: 0] += 1
            }
        }
        
        var i = 1;
        while i <= n {
            let incoming = incomingNodes[i] ?? 0
            let outgoing = outGoingNodes[i] ?? 0
            if ((incoming == (n-1)) && (outgoing == 0)){
                return i
            }
            i += 1
        }
        return -1
    }
}

class Solution2 {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var trustScores = Array(repeating: 0, count: n + 1)
        for pair in trust {
            let a = pair[0]
            let b = pair[1]
            trustScores[a] -= 1
            trustScores[b] += 1
        }
    
        for i in 1...n {
            if trustScores[i] == n - 1 {
                return i
            }
        }
        return -1
    }
}

let n = 3
let trust = [[1,3],[2,3],[3,1]]

let result = Solution().findJudge(n , trust)
print("result", result)