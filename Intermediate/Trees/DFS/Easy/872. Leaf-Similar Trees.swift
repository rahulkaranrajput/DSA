/*
Consider all the leaves of a binary tree, from left to right order, the values of those leaves form a leaf value sequence.



For example, in the given tree above, the leaf value sequence is (6, 7, 4, 9, 8).

Two binary trees are considered leaf-similar if their leaf value sequence is the same.

Return true if and only if the two given trees with head nodes root1 and root2 are leaf-similar.

 

Example 1:


Input: root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]
Output: true
Example 2:


Input: root1 = [1,2,3], root2 = [1,3,2]
Output: false
 

Constraints:

The number of nodes in each tree will be in the range [1, 200].
Both of the given trees will have values in the range [0, 200].
*/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func insert(_ root: TreeNode?, _ val: Int) -> TreeNode {
    let newNode = TreeNode(val)

    guard let root = root else {
        return newNode
    }

    var queue: [TreeNode] = [root]

    while !queue.isEmpty {
        let current = queue.removeFirst()

        if current.left == nil {
            current.left = newNode
            break
        } else {
            queue.append(current.left!)
        }

        if current.right == nil {
            current.right = newNode
            break
        } else {
            queue.append(current.right!)
        }
    }

    return root
}

let values1 = [3,5,1,6,2,9,8,7,4]
let values2 = [3,5,1,6,7,4,2,9,8]
var root1: TreeNode? = nil
var root2: TreeNode? = nil

for v in values1 {
    root1 = insert(root1, v)
}

for v in values2 {
    root2 = insert(root2, v)
}

class Solution {
    func dfs(_ root: TreeNode?, _ result: inout [Int] ) {
        guard let node = root else { return }
        if node.left == nil && node.right == nil {
            result.append(node.val)
            return
        }
        dfs(node.left, &result)
        dfs(node.right, &result)
    }

    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var result1 = [Int]()
        var result2 = [Int]()

        dfs(root1, &result1)
        dfs(root2, &result2)
        return result1 == result2
    }
}

let result = Solution().leafSimilar(root1, root2)
print(result)