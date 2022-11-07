
import Foundation


/* 21.判断链表是否有环
 
 给你一个链表的头节点 head ，判断链表中是否有环。
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
    // 快慢指针
    static func hasCycle(_ head: ListNode?) -> Bool {
        if (head == nil || head?.next == nil) {
            return false
        }
        var slow = head
        var fast = head?.next
        
        while (slow !== fast) {
            if (fast == nil || fast?.next == nil) {
                return false
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return true
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
    node5.next = node3
    return node1
}

var resultNode = Solution.hasCycle(createList())
print("判断链表是否有环 输出：\(resultNode)")

