
import Foundation


/*
 
 8.合并两个排序的链表
 
 题目描述：
 
 输入两个单调递增的链表，输出两个链表合成后的链表，当然我们需要合成后的链表满足单调不减规则。
 
 示例：
 
 输入：
 {1,3,5},{2,4,6}

 
 返回值：
 {1,2,3,4,5,6}

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
  
    /// 方法一： 递归
    func Merge1 ( _ pHead1: ListNode?,  _ pHead2: ListNode?) -> ListNode? {
        if (pHead1 == nil) { return pHead2 }
        if (pHead2 == nil) { return pHead1 }

        if (pHead1!.val < pHead2!.val) {
            pHead1?.next = Merge1(pHead1!.next, pHead2)
            return pHead1
        } else {
            pHead2?.next = Merge1(pHead1, pHead2!.next)
            return pHead2
        }
    }
    
    /// 方法二： 遍历两个链表，按大小顺序拼接。
    /// 时间复杂度为O(n)
    
    func Merge2 ( _ p1: ListNode?,  _ p2: ListNode?) -> ListNode? {
        if (p1 == nil) { return p2 }
        if (p2 == nil) { return p1 }
       
        var pHead1 = p1
        var pHead2 = p2

        let head = ListNode(0)
        var cur: ListNode = head
        // 使用while循环，遍历pHead1和pHead2
        while (pHead1 != nil && pHead2 != nil) {
            if pHead1!.val < pHead2!.val {
                // 把pHead1添加到heade中， 并移动pHead1
                cur.next = pHead1!
                pHead1 = pHead1?.next
            } else {
                // 把pHead2添加到heade中， 并移动pHead2
                cur.next = pHead2
                pHead2 = pHead2?.next
            }
            cur = cur.next!
        }
        
        // 接下来就是剩下的p1或者p2，因为剩下的p1或者p2一定是有序的，所以可以直接返回header.next。
        
        // 当只剩p1时，将p1添加到header中
        if (pHead1 != nil) {
            cur.next = pHead1
        }
        // 当只剩p2时，将p2添加到header中。
        if (pHead2 != nil) {
            cur.next = pHead2
        }
        return head.next
    }
}

// 创建测试链表 1 3 5  返回链表的头节点
func createList1() -> ListNode? {
    let node1 = ListNode(1)
    let node3 = ListNode(3)
    let node5 = ListNode(5)
    node1.next = node3
    node3.next = node5
    return node1
}

// 创建测试链表 2 4 6  返回链表的头节点
func createList2() -> ListNode? {
    let node2 = ListNode(2)
    let node4 = ListNode(4)
    let node6 = ListNode(6)
    node2.next = node4
    node4.next = node6
    return node2
}

var sortNode = Solution().Merge2(createList1(), createList2())
var string = ""
while sortNode != nil {
    string.append("\(sortNode!.val)->")
    sortNode = sortNode?.next
}
print("合并两个排序的链表：\(string)")


