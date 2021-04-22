
/* 2. 最长公共前缀
 
 题目描述:
 编写一个函数来查找字符串数组中的最长公共前缀。
 如果不存在公共前缀，返回空字符串 ""
 
 示例:
 输入：strs = ["flower","flow","flight"]
 输出："fl"
 
 输入：["abca","abc","abca","abc","abcc"]
 输出："abc"
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
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
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        if strs.count == 1 {
            return strs.first!
        }
        let firstString = strs.first
        var shortestLength = firstString?.count
        //        for str in strs {
        //            shortestLength = min(str.count, shortestLength!) // 最短的字符位数
        //        }
        var prefixStr = ""
        for index in 0 ..< shortestLength! {
            let character = firstString![firstString!.index(firstString!.startIndex, offsetBy: index)]
            var isCommon = true
            for str in strs {
                shortestLength = min(str.count, shortestLength!)
                if index < shortestLength! {
                    let c = str[str.index(str.startIndex, offsetBy: index)]
                    if c != character {
                        isCommon = false
                        break
                    }
                } else {
                    isCommon = false
                }
                
            }
            if isCommon {
                prefixStr.append(character)
            }
        }
        return prefixStr
    }
}


//// test

var strs = ["flower","flow","flight"]
var string = Solution().longestCommonPrefix(strs)
print("\(strs) 最长公共前缀：\(string)")

strs = ["abca","abc","abca","abc","ac"]
string = Solution().longestCommonPrefix(strs)
print("\(strs) 最长公共前缀：\(string)")
