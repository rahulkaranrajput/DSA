/*
Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

Example 1:


Input: root = [1,2,2,3,4,4,3]
Output: true
Example 2:


Input: root = [1,2,2,null,3,null,3]
Output: false
 

Constraints:

The number of nodes in the tree is in the range [1, 1000].
-100 <= Node.val <= 100
*/

class Solution {
    func dfs(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        guard let node1 = left, let node2 = right else {
            return left == nil && right == nil
        }
        return (node1.val == node2.val) && dfs(node1.left, node2.right) &&
               dfs(node1.right, node2.left)
    }

    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let node = root else { return true}
        return dfs(node.left, node.right);
    }
}