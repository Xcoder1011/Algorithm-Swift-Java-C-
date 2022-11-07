
/* 2. 反转链表II
 
 题目描述:
 给你单链表的头指针 head 和两个整数 left 和 right ，其中 left <= right 。请你反转从位置 left 到位置 right 的链表节点，返回 反转后的链表 。

 示例:
 输入：head = [1,2,3,4,5], left = 2, right = 4
 输出：[1,4,3,2,5]

 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

public class Solution {
    
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        // 1. 创建一个虚拟节点头
        var dummyNode = ListNode(-1)
        dummyNode.next = head
        
        // 2. 创建pre节点，走left-1步，移到left左边一个节点的位置
        var pre: ListNode? = dummyNode
        for _ in 0 ..< left-1 {
            pre = pre?.next
        }
        
        // 3. 创建rightNode节点，从pre位置走right-left+1步，移到left左边一个节点的位置
        var rightNode = pre
        for _ in left ... right {
            rightNode = rightNode?.next
        }
        
        // 4. 记录leftNode和successor位置
        var leftNode = pre?.next
        let succ = rightNode?.next
        
        // 5. 断链， 将链表 断开 为3段
        pre?.next = nil
        rightNode?.next = nil
        
        // 6. 对需要反转的中间段（子链表），进行布局反转
        reverseLinkedList(leftNode)
        
        // 7、拼接
        pre?.next = rightNode
        leftNode?.next = succ
        
        return dummyNode.next
    }
    
    // 反转单链表
    func reverseLinkedList(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var current = head
        while(current != nil) {
            let next = current?.next
            current?.next = pre
            
            pre = current
            current = next
        }
        return pre
    }
}

// 创建测试链表 1->2->3->4->5  返回链表的头节点
func createList() -> ListNode? {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    return node1
}

// test 方法1
var nextNode : ListNode? = Solution().reverseBetween(createList(), 2, 4)
var string = ""
while nextNode != nil {
    string.append("\(nextNode!.val)->")
    nextNode = nextNode?.next
}
print("方法1： 反转结果：\(string)")

