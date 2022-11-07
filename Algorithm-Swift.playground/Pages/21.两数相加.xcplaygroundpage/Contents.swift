
import Foundation

/* 21.两数相加
 
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 示例 2：

 输入：l1 = [0], l2 = [0]
 输出：[0]
 示例 3：

 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]

 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
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

class Solution {
    
    // 方法一：使用预先指针 + 进位
    func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 对于链表问题，返回结果为头结点时，通常需要先初始化一个预先指针 pre，
        // 该指针的下一个节点指向真正的头结点head。
        let pre = ListNode()
        var current = pre
        // 进位值 carray
        var carray = 0
        var l1 = l1, l2 = l2
        
        while (l1 != nil || l2 != nil) {
            // 将两个链表看成是相同长度的进行遍历，如果一个链表较短则在前面补 0，比如 987 + 23 = 987 + 023 = 1010
            let num1 = l1 == nil ? 0 : l1?.val ?? 0
            let num2 = l2 == nil ? 0 : l2?.val ?? 0
            // 计算和： 需要加上 进位carry
            var sum = num1 + num2 + carray
            // 链表处相应位置的数字为 sum % 10
            current.next = ListNode(sum % 10)
            // 更新进位值
            carray = sum / 10
            current = current.next!
            
            if (l1 != nil) {
                l1 = l1?.next
            }
            if (l2 != nil) {
                l2 = l2?.next
            }
        }
        // 如果链表遍历结束后，有 carray > 0，还需要在答案链表的后面附加一个节点，节点的值为carray
        if carray > 0 {
            current.next = ListNode(carray)
        }
        return pre.next
    }
    
    
    // 方法二：
    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return nil
        }
        let nums1 = numsFromNode(l1)
        let nums2 = numsFromNode(l2)
        let maxCount = max(nums1.count, nums2.count)
        let head = ListNode()
        var addNum = 0
        var value = (0 < nums1.count ?  nums1[0] : 0)
        + (0 < nums2.count ?  nums2[0] : 0)
        if (value >= 10) {
            addNum = value / 10
            if let c = String(value).last , let num = Int(c.lowercased()){
                value = num
            }
        }
        value += addNum
        head.val = value
        var temp = head
        for i in 1 ..< maxCount {
            let node = ListNode()
            value = (i < nums1.count ?  nums1[i] : 0)
            + (i < nums2.count ?  nums2[i] : 0)
            value += addNum
            if (value >= 10) {
                addNum = value / 10
                if let c = String(value).last , let num = Int(c.lowercased()){
                    value = num
                }
            } else {
                addNum = 0
            }
            node.val = value
            temp.next = node
            if let next = temp.next {
                temp = next
            }
        }
        return head
    }
    
    func numsFromNode(_ node: ListNode?) -> [Int] {
        guard let node = node else {
            return []
        }
        var current = node
        var nums: [Int] = []
        while (current.next != nil) {
            nums.append(current.val)
            current = current.next!
        }
        if (current.next == nil) {
            nums.append(current.val)
        }
        return nums.reversed()
    }
}


// 创建测试链表 1->2->3->4->5  返回链表的头节点
func createList1() -> ListNode? {
    let node1 = ListNode(2)
    let node2 = ListNode(4)
    let node3 = ListNode(3)
    node1.next = node2
    node2.next = node3
    return node1
}

func createList2() -> ListNode? {
    let node1 = ListNode(5)
    let node2 = ListNode(6)
    let node3 = ListNode(4)
    node1.next = node2
    node2.next = node3
    return node1
}

// test 方法1
var nextNode = Solution().addTwoNumbers1(createList1(), createList2())
var string = ""
while nextNode != nil {
    string.append("\(nextNode!.val)->")
    nextNode = nextNode?.next
}
print("方法1： 递归 输出：\(string)")
