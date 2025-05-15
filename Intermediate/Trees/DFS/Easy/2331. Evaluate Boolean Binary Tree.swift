/*
You are given the root of a full binary tree with the following properties:

Leaf nodes have either the value 0 or 1, where 0 represents False and 1 represents True.
Non-leaf nodes have either the value 2 or 3, where 2 represents the boolean OR and 3 represents the boolean AND.
The evaluation of a node is as follows:

If the node is a leaf node, the evaluation is the value of the node, i.e. True or False.
Otherwise, evaluate the node's two children and apply the boolean operation of its value with the children's evaluations.
Return the boolean result of evaluating the root node.

A full binary tree is a binary tree where each node has either 0 or 2 children.

A leaf node is a node that has zero children.

 

Example 1:


Input: root = [2,1,3,null,null,0,1]
Output: true
Explanation: The above diagram illustrates the evaluation process.
The AND node evaluates to False AND True = False.
The OR node evaluates to True OR False = True.
The root node evaluates to True, so we return true.
Example 2:

Input: root = [0]
Output: false
Explanation: The root node is a leaf node and it evaluates to false, so we return false.
 

Constraints:

The number of nodes in the tree is in the range [1, 1000].
0 <= Node.val <= 3
Every node has either 0 or 2 children.
Leaf nodes have a value of 0 or 1.
Non-leaf nodes have a value of 2 or 3.
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

    func evaluateTree(_ root: TreeNode?) -> Bool {
        guard let _ = root?.left else {
            return (root?.val ?? 0) == 1
        }
        if (root?.val ?? 0) == 2 {
            return self.evaluateTree(root?.left) || self.evaluateTree(root?.right)
        } else {
            return self.evaluateTree(root?.left) && self.evaluateTree(root?.right)
        }
    }
}


class Solution2 {
    func evaluateTree(_ root: TreeNode?) -> Bool {
        guard let node = root else { return false}
        var stack = [(TreeNode, Bool)]()
        var result = [Bool]()

        stack.append((node, false))

        while !stack.isEmpty {
            let (top,isVisited) = stack.removeLast()

            if isVisited {

                if top.left == nil && top.right == nil {
                    result.append(top.val == 1)
                } else {
                    let right = result.removeLast()
                    let left = result.removeLast()

                    if top.val == 2 {
                        result.append(right || left)
                    } else if top.val == 3 {
                        result.append(right && left)
                    }
                }
            } else {
                stack.append((top,true))

                if let right = top.right {
                    stack.append((right, false))
                }

                if let left = top.left {
                    stack.append((left, false))
                }
            }
        }

        return result.last ?? false
    }
}


let values = [2,1,3,nil,nil,0,1]
let root = buildTree(from: values)

let result = Solution2().evaluateTree(root)
print(result)





