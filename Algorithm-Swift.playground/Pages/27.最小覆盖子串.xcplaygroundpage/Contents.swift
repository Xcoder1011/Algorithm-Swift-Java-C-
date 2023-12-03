/*
 
 最小覆盖子串
 
 
 给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 "" 。
 
  
 注意：
 
 对于 t 中重复字符，我们寻找的子字符串中该字符数量必须不少于 t 中该字符数量。
 如果 s 中存在这样的子串，我们保证它是唯一的答案。
  
 
 示例 1：
 
 输入：s = "ADOBECODEBANC", t = "ABC"
 输出："BANC"
 示例 2：
 
 输入：s = "a", t = "a"
 输出："a"
 示例 3:
 
 输入: s = "a", t = "aa"
 输出: ""
 解释: t 中两个字符 'a' 均应包含在 s 的子串中，
 因此没有符合条件的子字符串，返回空字符串。
  
 
 提示：
 
 1 <= s.length, t.length <= 105
 s 和 t 由英文字母组成
  
 
 进阶：你能设计一个在 o(n) 时间内解决此问题的算法吗？
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/minimum-window-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 
 */

class Solution {
    
    static func minWindow(_ s: String, _ t: String) -> String {
        
        // 为了方便处理，这里将字符串转成字符数组
        let sArray = [Character](s)
        // [字符 : 次数]
        var windowDict = [Character: Int]()
        var targetDict = [Character: Int]()
        
        for c in t {
            targetDict[c, default: 0] += 1
        }
        // 滑动窗口的两端索引位置
        var left = 0, right = 0
        // 匹配次数，等于targetDict的key数量时代表已经匹配完成
        var matchCount = 0
        
        // 记录最小覆盖子串的 索引位置
        var start = 0, end = 0
        // 记录最小范围
        var minLen = Int.max

        while right < sArray.count {
            // 开始移动窗口右侧端点
            let rChar = sArray[right]
            right += 1
            // 右端点字符不是所需字符直接跳过
            if targetDict[rChar] == nil {
                continue
            }
            windowDict[rChar, default: 0] += 1
            if windowDict[rChar] == targetDict[rChar] {
                matchCount += 1
            }
            
            // 如果匹配完成，开始移动窗口左侧断点, 目的是为了寻找当前窗口的最小长度
            while matchCount == targetDict.count {
                if right - left < minLen {
                    start = left
                    end = right
                    minLen = right - left
                }
                
                let lChar = sArray[left]
                left += 1
                if targetDict[lChar] == nil {
                    continue
                }
                // 如果当前左端字符的窗口中数量和所需数量相等，则后续移动就不满足匹配了，匹配数-1
                if windowDict[lChar] == targetDict[lChar] {
                    matchCount -= 1
                }
                // 减少窗口字典中对应字符的数量
                windowDict[lChar]! -= 1
            }
        }
        return minLen == Int.max ? "" : String(sArray[start ..< end])
    }
}

let ans = Solution.minWindow("ADOBECODEBANC", "ABC");
print("ans = \(ans)")


