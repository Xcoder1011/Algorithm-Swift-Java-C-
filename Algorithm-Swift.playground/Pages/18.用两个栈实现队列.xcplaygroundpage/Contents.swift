//: [Previous](@previous)

import Foundation
/*
 18.用两个栈实现队列
 
 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )
 
 栈是一种仅支持在表尾进行插入和删除操作的线性表，这一端被称为栈顶，另一端被称为栈底。
 队列是一种仅支持在表尾进行插入操作、在表头进行删除操作的线性表，插入端称为队尾，删除端称为队首
  
 
 示例 1：
 
 输入：
 ["CQueue","appendTail","deleteHead","deleteHead"]
 [[],[3],[],[]]
 输出：[null,null,3,-1]
 示例 2：
 
 输入：
 ["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
 [[],[],[5],[2],[],[]]
 输出：[null,-1,null,null,5,2]
 提示：
 
 1 <= values <= 10000
 最多会对 appendTail、deleteHead 进行 10000 次调用
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class CQueue {
    
    var stack1: [Int]
    var stack2: [Int]
    
    
    init() {
        stack1 = []
        stack2 = []
    }
    
    // push
    func appendTail(_ value: Int) {
        // 入队的时候只把数据存储在stack1中即可
        stack1.append(value)
    }
    
    // pop
    func deleteHead() -> Int {
        if stack2.count ==  0 {
            //1. 即两个栈都为空，无元素，因此返回 -1
            if stack1.count == 0  {
                return -1
            }
            // 设有含三个元素的栈 A = [1,2,3] 和空栈 B = []。若循环执行 A 元素出栈并添加入栈 B ，直到栈 A 为空，则 A = [], B = [3,2,1]，即 栈 B 元素实现栈 A 元素倒序 。
            
            //2. stack2没有数据, 将栈stack1 元素全部转移至栈stack2 中，实现元素倒序，并返回栈 stack2 的栈顶元素。
            while stack1.count > 0 {
                stack2.append(stack1.removeLast())
            }
        }
        // 3.stack2有已完成倒序的元素，因此直接返回 stack2 的栈顶元素。
        return stack2.removeLast()
    }
}

/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */
