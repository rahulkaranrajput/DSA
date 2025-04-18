class Solution {
    func dfs(_ root: TreeNode?) {
        guard let node = root else { return }

        print(node.val)
        dfs(node.left)
        dfs(node.right)
    }
}