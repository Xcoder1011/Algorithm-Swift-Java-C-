
/*
 17.最大升序子数组和
 
 问题描述：
 
 给你一个正整数组成的数组 nums ，返回 nums 中一个 升序 子数组的最大可能元素和。
 
 子数组是数组中的一个连续数字序列。
 
 已知子数组 [numsl, numsl+1, ..., numsr-1, numsr] ，若对所有 i（l <= i < r），numsi < numsi+1 都成立，则称这一子数组为 升序 子数组。注意，大小为 1 的子数组也视作 升序 子数组。
 
  
 
 示例 1：
 
 输入：nums = [10,20,30,5,10,50]
 输出：65
 解释：[5,10,50] 是元素和最大的升序子数组，最大元素和为 65 。
 示例 2：
 
 输入：nums = [10,20,30,40,50]
 输出：150
 解释：[10,20,30,40,50] 是元素和最大的升序子数组，最大元素和为 150 。
 示例 3：
 
 输入：nums = [12,17,15,13,10,11,12]
 输出：33
 解释：[10,11,12] 是元素和最大的升序子数组，最大元素和为 33 。
 示例 4：
 
 输入：nums = [100,10,1]
 输出：100
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/maximum-ascending-subarray-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    
    // 最大子数组和
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var sum = nums[0]
        var currentSum = nums[0]
        // currentSum 记录当前子数组的最大元素和。
        for i in 1 ..< nums.count {
            currentSum = max(currentSum + nums[i], nums[i])
            sum = max(sum, currentSum)
        }
        return sum
    }
    
    // 最大升序子数组和
    func maxAscendingSum(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var sum = nums[0]
        // currentSum 记录当前子数组的最大元素和
        var currentSum = nums[0]
        for i in 1 ..< nums.count {
            if nums[i-1] < nums[i] {
                currentSum += nums[i]
            } else {
                // 不满足升序时， 重置 当前子数组的最大元素和 为  nums[i]
                currentSum = nums[i]
            }
            sum = max(sum, currentSum)
        }
        return sum
    }
}

let solution = Solution()
var sum1 = solution.maxSubArray([12,17,15,13,10,11,12])
var sum2 = solution.maxAscendingSum([12,17,15,13,10,11,12])
print("最大子数组和 is \(sum1)")
print("最大升序子数组和 is \(sum2)")


sum1 = solution.maxSubArray([10,20,30,5,10,50])
sum2 = solution.maxAscendingSum([10,20,30,5,10,50])
print("最大子数组和 is \(sum1)")
print("最大升序子数组和 is \(sum2)")





