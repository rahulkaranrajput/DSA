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