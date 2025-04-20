
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
    func insert(_ node: ListNode, _ value: Int) {
        var head = node;
        while head.next != nil {
            guard let next = head.next else { return }
            head = next;
        }
        let tempNode = ListNode()
        tempNode.val = value;
        head.next = tempNode;
    }

    func printList(_ node: ListNode) {
        var head = node;
        while head.next != nil{
            print(head.val, "->", terminator: "");
            guard let next = head.next else { return }
            head = next;
        }
        print(head.val);
    }

    func middleNode(_ head: ListNode?) -> ListNode? {
        guard let node = head else { return nil }
        if node.next == nil{
            return node
        }
        var curr = node;
        var actualnode = node;
        while curr.next != nil {
            guard let nextNode = actualnode.next, let otherNextNode = curr.next?.next else {return actualnode.next}
            actualnode = nextNode;
            curr = otherNextNode;
        }
        return actualnode;
    }
}

var head = ListNode();
head.val = 1
var obj = Solution();
obj.insert(head, 2);
obj.insert(head, 3);
obj.insert(head, 4);
obj.insert(head, 5);
obj.insert(head, 6);

obj.printList(head);
let middileNode = obj.middleNode(head);
if let node = middileNode  {
    print(node.val)
}
