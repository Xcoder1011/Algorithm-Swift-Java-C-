//: [Previous](@previous)

import Foundation

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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode?{
        return nil
    }
}
