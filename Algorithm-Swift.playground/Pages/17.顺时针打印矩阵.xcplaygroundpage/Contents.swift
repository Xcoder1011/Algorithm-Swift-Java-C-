//: [Previous](@previous)

import Foundation

/*
 17.顺时针打印矩阵
 
 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。
 
 
 示例 1：
 
 1  2  3  4
 5  6  7  8
 9  10 11 12
 
 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 
 示例 2：
 
 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]
  
 
 限制：
 
 0 <= matrix.length <= 100
 0 <= matrix[i].length <= 100
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/shun-shi-zhen-da-yin-ju-zhen-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        guard matrix.count > 0 else { return [] }
        
        var result: [Int] = []
        var left = 0
        var right = matrix[0].count - 1
        var top = 0
        var bottom = matrix.count - 1
        
        while left <= right && top <= bottom {
            
            // 1.上边界 从左到右
            for i in left...right {
                result.append(matrix[top][i])
            }
            //上边界向下
            top+=1
            if top > bottom {
                break
            }
            
            // 2.右边界 从上到下
            for i in top...bottom {
                result.append(matrix[i][right])
            }
            // 右边界向左
            right-=1
            if left > right {
                break
            }
            
            // 3.下边界 从右往左
            for i in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][i])
            }
            // 下边界向上
            bottom-=1
            if top > bottom {
                break
            }


            // 4.左边界 从下往上
            for i in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[i][left])
            }
            // 左边界向左
            left+=1
            if left > right {
                break
            }
        }
        return result
    }
}


let solution = Solution()
var orders = solution.spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
print("orders is \(orders)")


orders = solution.spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
print("orders is \(orders)")
