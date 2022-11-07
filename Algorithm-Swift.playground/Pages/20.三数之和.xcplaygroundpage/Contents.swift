
import Foundation

/* 20. 三数之和
 
 题目描述：
 
 给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请

 你返回所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

  
 示例 1：

 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 解释：
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。
 不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。
 注意，输出的顺序和三元组的顺序并不重要。
 示例 2：

 输入：nums = [0,1,1]
 输出：[]
 解释：唯一可能的三元组和不为 0 。
 示例 3：

 输入：nums = [0,0,0]
 输出：[[0,0,0]]
 解释：唯一可能的三元组和为 0 。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


class Solution {
    
    //方法一： 排序 + 双指针
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else {
            return []
        }
        // 对nums从小到大排序
        let nums = nums.sorted()
        var ans: [[Int]] = []
        let count = nums.count
        for i in 0 ..< count {
            // [nums[i], nums[L], nums[R]] 排序数组中， nums[i]为第一个元素， 如果第一个元素元素都大于0
            // 则 nums[i] + nums[L] + nums[R] 肯定大于0，不用计算了
            if nums[i] > 0 {
                return ans
            }
            
            // 去重，当起始的值等于前一个元素，那么得到的结果将会和前一次相同
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            
            // 定义两个指针 L 和 R
            var L = i + 1
            var R = count - 1
            
            while L < R {
                let sum = nums[i] + nums[L] + nums[R]
                if sum == 0 {
                    // 记录三数之和等于0的数组
                    let array = [nums[i], nums[L], nums[R]]
                    ans.append(array)
                    
                    // 判断左界是否和下一位置重复，去除重复解
                    while L < R && nums[L] == nums[L+1] {
                        L += 1
                    }
                    // 判断右界是否和下一位置重复，去除重复解
                    while L < R && nums[R-1] == nums[R] {
                        R -= 1
                    }
                    
                    // 将 左指针右移，将右指针左移。
                    L += 1
                    R -= 1
                } else if sum > 0 {
                   //若和大于 0，说明 nums[R] 太大，R 左移
                    R -= 1
                } else {
                    // 若和小于 0，说明 nums[L] 太小，L 右移
                    L += 1
                }
            }
        }
        return ans
    }
}

let ans = Solution().threeSum([-1,0,1,2,-1,-4])
print("ans = \(ans)")



