
import Foundation


/* 34.无限集中的最小数字
 
 现有一个包含所有正整数的集合 [1, 2, 3, 4, 5, ...] 。

 实现 SmallestInfiniteSet 类：

 SmallestInfiniteSet() 初始化 SmallestInfiniteSet 对象以包含 所有 正整数。
 int popSmallest() 移除 并返回该无限集中的最小整数。
 void addBack(int num) 如果正整数 num 不 存在于无限集中，则将一个 num 添加 到该无限集中。

 
 */


class SmallestInfiniteSet {

    var nums: [Int]
    var sortNums: [Int]
    var minValue: Int
    
    init() {
        nums = []
        sortNums = []
        minValue = 1 // 无限集合中最小值 , 无限集合的范围可以认为是从 1 到正无穷大，并且都是正整数。
    }
    
    func addBack(_ num: Int) {
        // 添加元素的时候如果添加的值大于等于无限集合中的最小值 min ，就不要添加，
        // 因为无限集合是连续的，添加的元素在无限集合中已经存在。
        if !nums.contains(num) && num < minValue {
            nums.append(num)
            sortNums.append(num)
            sortNums = sortNums.sorted(by: <)
        }
    }
    
    func popSmallest() -> Int {
        // 这题的关键点是始终要保证无限集合是连续的。
        if nums.isEmpty {
            let min = minValue
            minValue += 1
            return min
        }
        if let num = sortNums.first, let index = nums.firstIndex(of: num) {
            nums.remove(at: index)
            sortNums.removeFirst()
            return num
        }
        return 1
    }
}

var set = SmallestInfiniteSet()
set.addBack(5)
set.addBack(2)
set.addBack(2)
set.addBack(0)
var minNum = set.popSmallest()
print("minNum1 = \(minNum)")
set.addBack(3)
minNum = set.popSmallest()
print("minNum2 = \(minNum)")

class Solution3 {
    func isValid(_ s: String) -> Bool {
        var stack = [String.Element]()
        for ch in s {
            switch ch {
            case "[":
                stack.append("]")
            case "{":
                stack.append("}")
            case "(":
                stack.append(")")
            default:
                let lastChar = stack.last
                if ch == lastChar {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

