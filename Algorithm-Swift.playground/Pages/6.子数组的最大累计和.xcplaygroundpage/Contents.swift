/*
 
 6.子数组的最大累加和
 
 题目描述：
 
 给定一个数组arr，返回子数组的最大累加和
 例如，arr = [1, -2, 3, 5, -2, 6, -1]，所有子数组中，[3, 5, -2, 6]可以累加出最大的和12，所以返回12.
 题目保证没有全为负数的数据
 [要求]
 时间复杂度为O(n)O(n)，空间复杂度为O(1)O(1)
 
 示例：
 
 输入：
 [1, -2, 3, 5, -2, 6, -1]

 返回值：
 12

 */

import Foundation

public class Solution {
    
    func maxsumofSubarray ( _ arr: [Int]) -> Int {
        // return function1(arr)
        return function1(arr)
    }
    
    // 方法一： 暴力解法
    // 求出所有的子数组的和，比较选择出最大值。利用双重循环就可以遍历到所有的子数组。
    // 时间复杂度为O(n*n)，空间复杂度为O(1)
    func function1(_ arr: [Int]) -> Int {
        var sum = arr[0];
        var max = sum;
        for i in 0..<arr.count  {
            sum = 0
            for j in i ..< arr.count {
                sum += arr[j]
                print("for i:\(i), j:\(j), sum: \(sum)")
                if (sum > max) {
                    max = sum
                    print("max: \(max)")
                }
            }
        }
        return max
    }
}

let solution = Solution()
let result = solution.maxsumofSubarray([1, -2, 3, 5, -2, 6, -1])
print("结果为：\(result)")
