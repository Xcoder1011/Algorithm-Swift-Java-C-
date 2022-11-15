
/* 29.三角形最小路径和
 
 
 给定一个三角形 triangle ，找出自顶向下的最小路径和。
 
 每一步只能移动到下一行中相邻的结点上。相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。也就是说，如果正位于当前行的下标 i ，那么下一步可以移动到下一行的下标 i 或 i + 1 。
 
  
 
 示例 1：
 
 输入：triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
 输出：11
 解释：如下面简图所示：
 2
 3 4
 6 5 7
 4 1 8 3
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 示例 2：
 
 输入：triangle = [[-10]]
 输出：-10
 
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/triangle
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
    
    // 方法一： 动态规划
    // 若定义 f(i, j) 为 从三角形顶部走到位置(i,j)的最小路径和，则
    
    // f(i,j) = min(f(i-1, j-1), f(i-1, j)) + triangle[i][j]
    
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        let count = triangle.count
        // 也可以 var dp = triangle
        var dp = Array(repeating: Array(repeating: 0, count: count), count: count)
        
        dp[0][0] = triangle[0][0]
        
        for i in 1 ..< count {
            // 注意1: 在第i行的 最左侧的时候， 只能从第 i−1 行的最左侧移动过来
            dp[i][0] = dp[i-1][0] + triangle[i][0]
            
            for j in 1 ..< i {
                dp[i][j] = min(dp[i-1][j-1], dp[i-1][j]) + triangle[i][j]
            }
            
            // 注意2: 当我们在第 i 行的最右侧时，我们只剩 从第 i-1 行的最右侧移动过来。
            dp[i][i] = dp[i-1][i-1] + triangle[i][i]
        }
        let lastSums = dp.last
        let minSum = lastSums?.sorted().first ?? 0
        return minSum
    }
    
    
    // 方法二： 递归解法
    // 若定义 f(i, j) 为 (i,j) 点到底边的最小路径和，则
    
    // f(i,j) = min(f(i+1, j), f(i+1, j+1)) + triangle[i][j]
    
    func minimumTotal2(_ triangle: [[Int]]) -> Int {
        // 记忆化存储 f(i,j)
        var dict = [String: Int]()
        return dfs(triangle, i: 0, j: 0, &dict)
    }
    
    func dfs(_ triangle: [[Int]], i: Int, j: Int, _ dict: inout [String: Int]) -> Int {
        
        // 最底一行， 到 底边的 路径和 为 0
        if i == triangle.count {
            return 0
        }
        
        let key = "\(i)_\(j)"
        if let sum = dict[key] {
            return sum
        }
        
        let num1 = dfs(triangle, i: i+1, j: j, &dict)
        let num2 = dfs(triangle, i: i+1, j: j+1, &dict)
        
        let sum = min(num1, num2) + triangle[i][j]
        // 记录存储 (i,j) 点到底边的最小路径和
        dict[key] = sum
        print(dict)
        return sum
    }
}

//var ans = Solution().minimumTotal([[-1],[2,3],[1,-1,-3]])
//print("三角形最小路径和1 = \(ans)")

var ans = Solution().minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]])
print("三角形最小路径和2 = \(ans)")

