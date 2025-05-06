/*
Given a string path, where path[i] = 'N', 'S', 'E' or 'W', each representing moving one unit north, south, east, or west, respectively. You start at the origin (0, 0) on a 2D plane and walk on the path specified by path.

Return true if the path crosses itself at any point, that is, if at any time you are on a location you have previously visited. Return false otherwise.

 

Example 1:


Input: path = "NES"
Output: false 
Explanation: Notice that the path doesn't cross any point more than once.
Example 2:


Input: path = "NESWW"
Output: true
Explanation: Notice that the path visits the origin twice.
 

Constraints:

1 <= path.length <= 104
path[i] is either 'N', 'S', 'E', or 'W'.
*/

struct Position: Hashable {
    let x: Int
    let y: Int
}

class Solution {
    func isPathCrossing(_ path: String) -> Bool {
        let directions: [Character: (Int, Int)] = [
            "N": (0, 1),
            "S": (0, -1),
            "E": (1, 0),
            "W": (-1, 0)
        ]

        var visiterPoints: Set<(Position)> = [Position(x:0, y:0)]
        var x = 0
        var y = 0

        for direction in path {
            if let move = directions[direction] {
                x += move.0
                y += move.1
                let position = Position(x: x, y: y)
                if visiterPoints.contains(position) {
                    return true
                }
                visiterPoints.insert(position)
            }
        }
        return false
    }
}

let path = "NESWW"

let result = Solution().isPathCrossing(path)

print(result)