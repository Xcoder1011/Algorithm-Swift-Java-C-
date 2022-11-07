
/*
 16.最大子数组和
 
 给你一个整数数组 nums ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 子数组 是数组中的一个连续部分。
 
  
 
 示例 1：
 
 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
 示例 2：
 
 输入：nums = [1]
 输出：1
 示例 3：
 
 输入：nums = [5,4,-1,7,8]
 输出：23
  
 
 提示：
 
 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
  
 
 进阶：如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的 分治法 求解。
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/maximum-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
    
    // 方法一：
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var sum = nums[0]
        var currentSum = nums[0]
        for i in 1 ..< nums.count {
            currentSum = max(currentSum + nums[i], nums[i])
            sum = max(sum, currentSum)
        }
        return sum
    }
    
    // 方法二： 动态规划
    func maxSubArray2(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        
        // dp[i]: 代表以第i个元素结尾的子数组最大总和
        // dp[i] = dp[i-1] + nums[i], 当dp[i-1] >= 0 时
        // 或者 dp[i] = nums[i], 抛弃dp[i-1]， 当dp[i-1] < 0 时
        
        // 状态转移方程： dp[i] = max(dp[i-1], 0) + nums[i]
        
        var dp = [Int](repeating: 0, count: nums.count)
        
        dp[0] = nums[0]
        var maxSum = nums[0]
        
        for i in 1 ..< nums.count {
            dp[i] = max(dp[i-1] + nums[i], nums[i])
            maxSum = max(maxSum, dp[i])
        }
        
        return maxSum
    }
}

let solution = Solution()
var sum = solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
print("sum is \(sum)")

sum = solution.maxSubArray([10,20,30,5,10,50])
print("sum is \(sum)")

sum = solution.maxSubArray([5,4,-1,7,8])
print("sum is \(sum)")

sum = solution.maxSubArray([1, -2, 3, 5, -2, 6, -1])
print("sum is \(sum)")




