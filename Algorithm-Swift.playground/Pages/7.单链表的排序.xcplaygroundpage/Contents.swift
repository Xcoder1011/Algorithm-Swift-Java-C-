//: [Previous](@previous)

import Foundation

/*
 
 7.单链表的排序
 
 题目描述：
 
 给定一个无序单链表，实现单链表的排序(按升序排序)。
 
 示例：
 
 输入：
 [1,3,2,4,5]


 返回值：
 {1,2,3,4,5}

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
   
    func sortInList ( _ head: ListNode?) -> ListNode? {
        if (head == nil || head?.next == nil) {
            return head;
        }
        var vals = [Int]()
        var cur = head
        while cur != nil {
            vals.append(cur!.val)
            cur = cur!.next
        }
        vals.sort()
        
        cur = head
        for i in 0 ..< vals.count {
            cur?.val = vals[i]
            print("node.val：\(cur!.val)")
            cur = cur!.next;
        }
       return head
    }
}

// 创建测试链表 1->3->2->4->5  返回链表的头节点
func createList() -> ListNode? {
    let node1 = ListNode(1)
    let node2 = ListNode(3)
    let node3 = ListNode(2)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    return node1
}

var sortNode = Solution().sortInList(createList())

var string = ""
while sortNode != nil {
    string.append("\(sortNode!.val)->")
    sortNode = sortNode?.next
}
print("单链表的排序输出：\(string)")

