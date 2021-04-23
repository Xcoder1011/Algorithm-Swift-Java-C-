
/* 1. 反转链表
 
题目描述:
输入一个链表，反转链表后，输出新链表的表头。

示例:
输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL

*/

public class ListNode {
    var val: Int
    var next: ListNode?
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
    /**
     * 方法1： 递归
     * 递归的两个条件:
     * 1.  终止条件是当前节点或者下一个节点==null
     * 2.  head.next.next = head
     */
    func reverseList1(_ head: ListNode?) -> ListNode? {
        // 终止条件是当前节点或者下一个节点==null
        if head == nil || head?.next == nil {
            return head
        }
        // 保存当前节点的下个节点
        let nextNode = head?.next
        // 使用递归函数，一直递归到链表的最后一个结点，该结点就是反转后的头结点，记作newHead
        // 这里的newHead就是最后一个节点 5
        let newHead = reverseList1(nextNode)
        // 如果链表是 1->2->3->4->5，那么此时的newHead就是5
        // 而head是4，head的下一个是5，下下一个是空
        // 所以head.next.next 就是5->4
        nextNode?.next = head
        // 防止链表循环，需要将head.next设置为空
        head?.next = nil
        // 每层递归函数都返回cur，也就是最后一个节点
        return newHead
    }
    
    /**
     * 方法2： 双指针迭代
     * pre <- cur 指针依次往后移
     */
    func reverseList2(_ head: ListNode?) -> ListNode? {
        // 申请两个指针, 指针pre 指向 nil,  指针cur 指向 head
        var pre: ListNode? = nil
        var cur: ListNode? = head
        var tempNode: ListNode? = nil
        // pre 在前,  cur 在后
        while cur != nil {
            // 记录一下 cur?.next
            tempNode = cur?.next
            // 每次让 cur 的 next 指向 pre, 然后不断遍历 cur。
            // 每次迭代到 cur，都将 cur 的 next 指向 pre， 然后 pre 和 cur 前进一位
            cur?.next = pre
        
            // pre  <- cur  指针依次往后移一个节点
            pre = cur
            cur = tempNode
        }
        // 循环结束后，cur为nil， 此时pre即为反转后的头结点
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
var nextNode : ListNode? = Solution().reverseList1(createList())
var string = ""
while nextNode != nil {
    string.append("\(nextNode!.val)->")
    nextNode = nextNode?.next
}
print("方法1： 递归 输出：\(string)")


// test 方法2
nextNode = Solution().reverseList2(createList())
 string = ""
while nextNode != nil {
    string.append("\(nextNode!.val)->")
    nextNode = nextNode?.next
}
print("方法2： 双指针迭代 输出：\(string)")
