import Foundation

/* 31.合并两个有序链表
 
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 */


class ListNode {
    var val: Int
    var next: ListNode?
    init(){
        self.val = 0
        self.next = nil
    }
    init(_ val: Int) {
        self.val = val
    }
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }

        // 设定一个哨兵节点preHead
        let preHead = ListNode()
        // 维护一个node指针，需要调整它的next指针
        var node: ListNode? = preHead
        
        var cur1 = list1
        var cur2 = list2
        
        while cur1 != nil && cur2 != nil {
            if cur1!.val < cur2!.val {
                node?.next = cur1
                cur1 = cur1?.next
            } else {
                node?.next = cur2
                cur2 = cur2?.next
            }
            node = node?.next
        }
        // 将非空链表接在合并链表的后面
        node?.next = cur1 != nil ? cur1 : cur2
        return preHead.next
    }
}
