/*
Given the root node of a binary search tree and two integers low and high, return the sum of values of all nodes with a value in the inclusive range [low, high].

 

Example 1:


Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
Output: 32
Explanation: Nodes 7, 10, and 15 are in the range [7, 15]. 7 + 10 + 15 = 32.
Example 2:


Input: root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
Output: 23
Explanation: Nodes 6, 7, and 10 are in the range [6, 10]. 6 + 7 + 10 = 23.
 

Constraints:

The number of nodes in the tree is in the range [1, 2 * 104].
1 <= Node.val <= 105
1 <= low <= high <= 105
All Node.val are unique.
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

func insert(_ root: TreeNode?, _ value: Int) -> TreeNode {
    guard let root = root else {
        return TreeNode(value)
    }

    if value < root.val {
        root.left = insert(root.left, value)
    } else if value > root.val {
        root.right = insert(root.right, value)
    }

    return root
}

class Solution {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let node = root else { return 0 }
        if node.val < low {
            return rangeSumBST(node.right, low, high)
        } else if node.val > high {
            return rangeSumBST(node.left, low, high)
        } else {
            return node.val
                + rangeSumBST(node.left, low, high)
                + rangeSumBST(node.right, low, high)
        }
    }

    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var sum = 0
        var stack: [TreeNode] = []
        if let root = root {
            stack.append(root)
        }

        while !stack.isEmpty {
            let node = stack.removeLast()
            if node.val >= low && node.val <= high {
                sum += node.val
            }
            if let left = node.left, node.val > low {
                stack.append(left)
            }
            if let right = node.right, node.val < high {
                stack.append(right)
            }
        }
        return sum
    }
}

let values = [10,5,15,3,7,13,18,1,6]
let  low = 6
let high = 10

var root: TreeNode? = nil

for v in values {
    root = insert(root, v)
}

let result = Solution().rangeSumBST(root, low, high)
print(result)