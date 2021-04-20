
/* 1. 反转链表
 
题目描述:
输入一个链表，反转链表后，输出新链表的表头。

示例:
输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL

*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
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
     * @return ListNode类
     */
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 终止条件是当前节点或者下一个节点==null
        if head == nil || head?.next == nil {
            return head
        }
        // 保存当前节点的下个节点
        let nextNode = head?.next
        // 这里的newHead就是最后一个节点
        let newHead = reverseList(nextNode)
        // 如果链表是 1->2->3->4->5，那么此时的newHead就是5
        // 而head是4，head的下一个是5，下下一个是空
        // 所以head.next.next 就是5->4
        nextNode?.next = head
        // 防止链表循环，需要将head.next设置为空
        head?.next = nil
        // 每层递归函数都返回cur，也就是最后一个节点
        return newHead
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

// test
var nextNode : ListNode? = Solution().reverseList(createList())
var string = ""
while nextNode != nil {
    string.append("\(nextNode!.val)->")
    nextNode = nextNode?.next
}
print("输出：\(string)")
