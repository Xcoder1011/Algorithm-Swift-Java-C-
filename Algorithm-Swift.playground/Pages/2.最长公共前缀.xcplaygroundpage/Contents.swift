
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
        // 如果是空数组，返回空字符串 ""
        if strs.isEmpty {
            return ""
        }
        // 如果是数组内只有一个字符串，最长公共前缀为该字符串
        if strs.count == 1 {
            return strs.first!
        }
        let firstString = strs.first
        // 记录最短的字符长度
        var shortestLength = firstString?.count
        // 最长公共前缀
        var prefixStr = ""
        // 遍历字符
        for index in 0 ..< shortestLength! {
            // 每次和任意一个字符串比较， 比如我这里 和 第一个字符串做比较
            let character = firstString![firstString!.index(firstString!.startIndex, offsetBy: index)]
            var isCommon = true
            // 遍历字符串数组, 因为和第一个字符串做计较，那这里可以跳过和自己本身作比较
            for i in 1 ..< strs.count {
                let str = strs[i]
                // 每次遍历的同时 进行长度比较，需要记录下最短的字符串长度
                shortestLength = min(str.count, shortestLength!)
                if index < shortestLength! {
                    let c = str[str.index(str.startIndex, offsetBy: index)]
                    print(" 第一字符：\(character)， 比较字符：\(c)")
                    // 遍历到的字符 如果 和 第一个字符串的 字符不一样，就认为该字符不属于公共前缀的部分，直接结束所有的遍历
                    if c != character {
                        print("字符不一样：\(c)")
                        isCommon = false
                        break
                    }
                } else {
                    // 超出最短的字符串长度时，说明后面的就不需要再遍历了，直接结束所有的遍历
                    print("超出最短的字符串长度范围：\(character)")
                    isCommon = false
                    break
                }
            }
            
            if isCommon {
                // 字符都相同的话，拼接起来
                prefixStr.append(character)
            } else {
                // 不是公共前缀的话，直接跳出双层循环
                break
            }
        }
        return prefixStr
    }
}


//// test

var strs = ["flower","flow","flight"]
var string = Solution().longestCommonPrefix(strs)
print("\(strs) 最长公共前缀：\(string)")

strs = ["abca","ab","abca","abc","ac"]
string = Solution().longestCommonPrefix(strs)
print("\(strs) 最长公共前缀：\(string)")

strs = ["a","b","c","d","a"]
string = Solution().longestCommonPrefix(strs)
print("\(strs) 最长公共前缀：\(string)")

strs = ["a","b","c","d","a"]
string = Solution().longestCommonPrefix(strs)
print("\(strs) 最长公共前缀：\(string)")
