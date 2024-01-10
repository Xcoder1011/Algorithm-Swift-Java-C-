
import Foundation


/* 35.有效的括号
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 每个右括号都有一个对应的相同类型的左括号。
 
 */

class Solution {
    static func isValid(_ s: String) -> Bool {
        var stack = [String.Element]()
        for ch in s {
            // 匹配左括号的时候，右括号先入栈，
            // 就只需要比较当前元素和栈顶相不相等就可以了
            switch ch {
            case "[":
                // 碰到左括号，就把相应的右括号入栈
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
        // 字符串遍历完之后，栈是空的，就说明全都匹配了
        return stack.isEmpty
    }
}

var res = Solution.isValid("()[]{}")
print("res 输出1：\(res)")
res = Solution.isValid("(]")
print("res 输出2：\(res)")
res = Solution.isValid("()")
print("res 输出3：\(res)")

