/*
You are given the array paths, where paths[i] = [cityAi, cityBi] means there exists a direct path going from cityAi to cityBi. Return the destination city, that is, the city without any path outgoing to another city.

It is guaranteed that the graph of paths forms a line without any loop, therefore, there will be exactly one destination city.

 

Example 1:

Input: paths = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
Output: "Sao Paulo" 
Explanation: Starting at "London" city you will reach "Sao Paulo" city which is the destination city. Your trip consist of: "London" -> "New York" -> "Lima" -> "Sao Paulo".
Example 2:

Input: paths = [["B","C"],["D","B"],["C","A"]]
Output: "A"
Explanation: All possible trips are: 
"D" -> "B" -> "C" -> "A". 
"B" -> "C" -> "A". 
"C" -> "A". 
"A". 
Clearly the destination city is "A".
Example 3:

Input: paths = [["A","Z"]]
Output: "Z"
 

Constraints:

1 <= paths.length <= 100
paths[i].length == 2
1 <= cityAi.length, cityBi.length <= 10
cityAi != cityBi
All strings consist of lowercase and uppercase English letters and the space character.
*/

class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var routeHashMap = [String: String]()
        for path in paths {
            if let key = path.first, let value = path.last {
                routeHashMap[key] = value
            }
        } 
        var start = paths[0][0]
        while let next = routeHashMap[start] {
            start = next
        }
        return start
    }
}

let paths = [["qMTSlfgZlC","ePvzZaqLXj"],
            ["xKhZXfuBeC","TtnllZpKKg"],
            ["ePvzZaqLXj","sxrvXFcqgG"],
            ["sxrvXFcqgG","xKhZXfuBeC"],
            ["TtnllZpKKg","OAxMijOZgW"]]

let result = Solution().destCity(paths)
print(result)