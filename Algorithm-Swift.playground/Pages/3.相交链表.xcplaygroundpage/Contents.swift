
/* 3.相交链表
 
 题目描述:
 
 给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。
 
 示例:
 
 输入：intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
 输出：Intersected at '2'
 解释：相交节点的值为 2 （注意，如果两个链表相交则不能为 0）。
 从各自的表头开始算起，链表 A 为 [1,9,1,2,4]，链表 B 为 [3,2,4]。
 在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。

 */

public class ListNode {
    var val: Int
    var next: ListNode?
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
    
    // 方法一： 双指针 pA 、pB
    
    // 链表 headA 和 headB 的长度分别是 m 和 n。假设链表 headA 的不相交部分有 a 个节点，链表 headB 的不相交部分有 b 个节点，两个链表相交的部分有 c 个节点，则有 a+c=m，b+c=n。
    
    // 指针 pA 移到链表 headB 的头节点，指针 pB 移到链表 headA 的头节点，然后两个指针继续移动，在指针 pA 移动了 a+c+b 次、指针 pB 移动了 b+c+a 次之后，两个指针会同时到达两个链表相交的节点，该节点也是两个指针第一次同时指向的节点，此时返回相交的节点。

    /*
     
     解题思路1：这种方法最简单，使用一个哈希表
     循环使用哈希表存储l1的所有结点地址；
     然后再次循环，判断l2是否有结点在哈希表中存在
     
     解题思路2：比较巧妙，使用两个指针pA,pB，不断迭代。
     当pA指向为nil，将pA指向lB的头结点；pB同理。
     如果他们有相交，循环结束，即指针地址一致；如果没相交，循环结束，指针都为ni。
     还需要注意，swift当中判断指针地址是否相等是用 ===，==是判断指向的实例是否相等。
     
     */
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        if headA == nil || headB == nil {
            return nil
        }
        
        var pA = headA
        var pB = headB
        
        while pA !== pB {
            pA = pA == nil ? headB : pA?.next
            pB = pB == nil ? headA : pB?.next
        }
        return pA
    }
    
}
