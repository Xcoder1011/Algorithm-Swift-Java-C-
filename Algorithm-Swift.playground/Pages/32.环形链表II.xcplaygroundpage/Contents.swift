
import Foundation


/* 32.寻找环形链表入环的第一个节点
 
 给定一个链表的头节点  head ，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
 
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
    
    /*
      head --- a --- 入环点 --- b --- 相遇点 ---- c ---  再次回到入换点
     
     快慢指针， fast 是 slow 的 2 倍
     
     在相遇点时， fast 走过的节点数 == slow 节点数的 2倍
     
     a + b + ( b + c) * N = ( a + b ) * 2
     
     N代表快指针在环内走了N圈， 令 N = 1, 则有 c = a
      
     */
    
    
    // 快慢指针
    static func detectCycle(_ head: ListNode?) -> ListNode? {
        
        // 定义快慢指针
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            
            // 快指针每次走两步
            slow = slow?.next
            fast = fast?.next?.next
            
            // 当快慢指针相遇时
            while slow == fast {
                
                // 当快慢指针相遇时，立即将fast指针指向head
                fast = head
                
                // 当slow指针按照每次走一步的速度，再走c个节点，就会回到入环点
                while slow != fast {
                    slow = slow?.next
                    fast = fast?.next
                }
                
                // 当fast从head走a个节点 到达入环点时， 快慢指针再次相遇
                // 此时 slow == fast
                return slow
            }
        }
        return nil
    }
}

extension ListNode: Equatable {
    public static func ==(_ lhs: ListNode, _ rhs: ListNode) -> Bool{
        return lhs === rhs
    }
}
