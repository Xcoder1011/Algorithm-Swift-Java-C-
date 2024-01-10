
import Foundation


/* 36.杨辉三角
 
 给定一个非负整数 numRows，生成「杨辉三角」的前 numRows 行。

 在「杨辉三角」中，每个数是它左上方和右上方的数的和。
 
 示例 1:

 输入: numRows = 5
 输出: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 示例 2:

 输入: numRows = 1
 输出: [[1]]
 
 */
class Solution {
    static func generate(_ numRows: Int) -> [[Int]] {
        var res: [[Int]] = Array(repeating: Array(repeating: 1, count: 1), count: numRows)
        for i in 0 ..< numRows {
            res[i] = Array(repeating: 1, count: i + 1)
        }
        if numRows <= 2 {
            return res
        }
        for i in 2 ..< numRows {
           for j in 1 ..< i {
               res[i][j] = res[i-1][j-1] + res[i-1][j]
           }
        }
        return res
    }
}

var res = Solution.generate(10)
print("res 输出：\(res)")


