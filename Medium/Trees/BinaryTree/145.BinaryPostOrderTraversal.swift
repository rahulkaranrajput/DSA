/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
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

// class Solution {
//     func postorderTraversal(_ root: TreeNode?) -> [Int] {
//         var result = [Int]()
//         postorder(root, &result)
//         return result
//     }
    
//     private func postorder(_ node: TreeNode?, _ result: inout [Int]) {
//         guard let node = node else { return }
//         postorder(node.left, &result)
//         postorder(node.right, &result)
//         result.append(node.val)
//     }
// }

class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var stack: [TreeNode] = [root]
        var result: [Int] = []

        while !stack.isEmpty {
            let node = stack.removeLast()
            result.append(node.val)

            if let left = node.left {
                stack.append(left)
            }

            if let right = node.right {
                stack.append(right)
            }
        }

        return result.reversed()
    }
}
