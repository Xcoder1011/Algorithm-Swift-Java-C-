
/* 25.无重复字符的最长子串
 
 题目描述:
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

 */
class Solution {
    // 方法一： 暴力方法
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let count = s.count
        if count == 1 {
            return 1
        }
        var maxLength = 0
        var tempStr = ""
        for i in 0 ..< count-1 {
            for j in i+1 ..< count {
                let startIndex = s.index(s.startIndex, offsetBy: i)
                let endIndex = s.index(s.startIndex, offsetBy: j)
                let str = s[startIndex...endIndex]
                let startChar = s[startIndex]
                let endChar = s[endIndex]
                // 1. 开始的字符和结束的字符不能相等
                // 2. 字符串不能有重复的字符
                if (tempStr.contains(endChar) || startChar == endChar) {
                    break
                } else {
                    tempStr = String(str)
                    maxLength = max(tempStr.count, maxLength)
                }
            }
            // 每一轮循环结束，将tempStr重置，因为只需记录 maxLength
            tempStr = ""
        }
        return maxLength
    }
    
    // 方法二： 滑动窗口
    // 时间复杂度：O(n)
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        let count = s.count
        if count == 1 {
            return 1
        }
        var maxLength = 0
        var start = 0
        // 定义一个 map 数据结构存储 (k, v)，其中 key 值为字符，value 值为字符位置 +1
        var map:[Character : Int] = [:]
        for end in 0 ..< count {
            // 随着 end 不断遍历向后，会遇到与 [start, end] 区间内字符相同的情况
            let endIndex = s.index(s.startIndex, offsetBy: end)
            let endChar = s[endIndex]
            if map.keys.contains(endChar) {
                // 碰到重复的字符了，就将 start 往右边移动
                if let index = map[endChar] {
                    start = max(index, start)
                }
            }
            // 加 1 表示从字符位置后一个才开始不重复
            map[endChar] = end + 1
            maxLength = max(end - start + 1, maxLength)
        }
        return maxLength
    }
}

let length = Solution().lengthOfLongestSubstring2("")
print(length)



