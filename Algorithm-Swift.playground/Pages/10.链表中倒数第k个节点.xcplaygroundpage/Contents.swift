
/* 10.链表中倒数第k个节点
 
 题目描述:
 
 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。
 
 例如，一个链表有 6 个节点，从头节点开始，它们的值依次是 1、2、3、4、5、6。这个链表的倒数第 3 个节点是值为 4 的节点。
 
 
 
 示例:
 给定一个链表: 1->2->3->4->5, 和 k = 2.
 返回链表 4->5.
 
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
    
    // 方法一：（可优化）
    // 使用了Dictionary存储Node, 代码耗时4ms， 可优化
    
    static func getKthFromEnd1(_ head: ListNode?, _ k: Int) -> ListNode? {
        var node = head
        var index = 0
        var dict: Dictionary<Int,ListNode> = [:]
        while node != nil {
            dict.updateValue(node!, forKey: index)
            node = node?.next
            index += 1
        }
        let count = dict.count
        node = dict[count-k]
        return node
    }
    
    // 方法二：（可优化）
    
    // 先遍历统计链表长度，记为 n ；
    // 设置一个指针走 (n-k) 步，即可找到链表倒数第 k 个节点。
    
    static func getKthFromEnd2(_ head: ListNode?, _ k: Int) -> ListNode? {
        var node = head
        // 1. 先遍历统计链表长度，记为 n ；
        var n = 0
        while node != nil {
            node = node?.next
            n += 1
        }
        
        // 2. 设置一个指针走 (n-k) 步，即可找到链表倒数第 k 个节点
        node = head
        var index = 0
        while node != nil && index < (n-k) {
            node = node?.next
            index += 1
        }
        return node
    }
    
    /*
     
     方法三： 双指针共同移动 （最佳）
     
     1.初始化： 快指针 fast 、慢指针 slow ，双指针都指向头节点 head​ 。
     2.构建双指针距离： 快指针 fast 先向前走 k 步（结束后，双指针 fast 和 slow 间相距 k 步）。
     3.双指针共同移动： 循环中，双指针 fast 和 slow 每轮都向前走一步，直至 fast 走过链表 尾节点 时跳出（跳出后， slow 与尾节点距离为 k−1，即 slow 指向倒数第 k 个节点）。
     4.返回值： 返回 slow 即可。
     
     
     打印：
     index = 0, slow : 1  fast: 1
     index = 1, slow : 1  fast: 2
     index = 2, slow : 1  fast: 3
     index = 3, slow : 2  fast: 4
     index = 4, slow : 3  fast: 5
     slow : 4
     链表中倒数第k个节点 输出：4->5->
     
     */
    static func getKthFromEnd3(_ head: ListNode?, _ k: Int) -> ListNode? {
        var slow = head
        var fast = head
        var index = 0
        while fast != nil {
            print("index = \(index), slow : \(slow?.val ?? 0)  fast: \(fast?.val ?? 0)")
            if index < k {
                fast = fast?.next
            } else {
                slow = slow?.next
                fast = fast?.next
            }
            index += 1
        }
        print("slow : \(slow?.val ?? 0)")
        return slow
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

var resultNode = Solution.getKthFromEnd3(createList(), 2)
var string = ""
while resultNode != nil {
    string.append("\(resultNode!.val)->")
    resultNode = resultNode?.next
}
print("链表中倒数第k个节点 输出：\(string)")
