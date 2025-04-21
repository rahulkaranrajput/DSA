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

class BST {
    func inorderTraversal(_ root: TreeNode?, _ prev: inout TreeNode?, _ result: inout Int) {
        guard let node = root else {
            return
        }
        inorderTraversal(node.left, &prev, &result)
        if prev != nil {
            print("result3", result);
            guard let prevNode = prev else { return }
            result = min(result, node.val - prevNode.val)
        }
        prev = node;
        inorderTraversal(node.right, &prev, &result)
    }

    func minDiffInBST(_ root: TreeNode?) -> Int {
        var result = Int.max;
        guard let head = root else { return result}
        var prev: TreeNode?
        print("result", result);
        inorderTraversal(head, &prev, &result)
        return result
    }

    func insert(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return TreeNode(val)
        }
        if val < root.val {
            root.left = insert(root.left, val)
        } else {
            root.right = insert(root.right, val)
        }

        return root
    }
}

let bst = BST()
var root: TreeNode? = TreeNode(10)
root = bst.insert(root, 5)
root = bst.insert(root, 15)
root = bst.insert(root, 12)

let minimumDifferece = bst.minDiffInBST(root);
print(minimumDifferece)