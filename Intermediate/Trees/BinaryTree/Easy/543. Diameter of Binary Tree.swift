/*
Given the root of a binary tree, return the length of the diameter of the tree.

The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

The length of a path between two nodes is represented by the number of edges between them.

 

Example 1:


Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
Example 2:

Input: root = [1,2]
Output: 1
 

Constraints:

The number of nodes in the tree is in the range [1, 104].
-100 <= Node.val <= 100
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

func buildTree(from array: [Int?]) -> TreeNode? {
    guard !array.isEmpty, let first = array[0] else { return nil }

    let root = TreeNode(first)
    var queue: [TreeNode] = [root]
    var i = 1

    while i < array.count {
        let current = queue.removeFirst()

        if i < array.count, let leftVal = array[i] {
            current.left = TreeNode(leftVal)
            queue.append(current.left!)
        }
        i += 1

        if i < array.count, let rightVal = array[i] {
            current.right = TreeNode(rightVal)
            queue.append(current.right!)
        }
        i += 1
    }

    return root
}



class Solution {
    func dfs(_ root: TreeNode?, _ result: inout Int) -> Int {
        guard let node = root else {
            return 0
        }
        let left = dfs(node.left, &result)
        let right = dfs(node.right, &result)

        result = max(result, (left + right))
        return 1 + max(left, right)
    }
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var result = 0
        let _ = dfs(root, &result)
        return result
    }
}

let values = [1,2]
let root = buildTree(from: values)

let result = Solution().diameterOfBinaryTree(root)
print(result)