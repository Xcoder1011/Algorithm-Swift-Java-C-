
/* 24. 买卖股票的最佳时机II
 
 题目描述:
 给你一个整数数组 prices ，其中 prices[i] 表示某支股票第 i 天的价格。

 在每一天，你可以决定是否购买和/或出售股票。你在任何时候 最多 只能持有 一股 股票。你也可以先购买，然后在 同一天 出售。

 返回 你能获得的 最大 利润 。


 示例 1：

 输入：prices = [7,1,5,3,6,4]
 输出：7
 解释：在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4 。
      随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6 - 3 = 3 。
      总利润为 4 + 3 = 7 。
 示例 2：

 输入：prices = [1,2,3,4,5]
 输出：4
 解释：在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5 - 1 = 4 。
      总利润为 4 。
 示例 3：

 输入：prices = [7,6,4,3,1]
 输出：0
 解释：在这种情况下, 交易无法获得正利润，所以不参与交易可以获得最大利润，最大利润为 0 。
  

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/best-time-to-buy-and-sell-stock-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class Solution {
    
    // 方法一： 贪心算法
    func maxProfit(_ prices: [Int]) -> Int {

        // 贪心算法： 只关心局部最优解
        // 对于 「今天的股价 - 昨天的股价」，得到的结果有 3 种可能：① 正数，② 00，③负数。
        // 贪心算法的决策是： 只加正数
        let count = prices.count
        if count < 2 {
            return 0
        }

        var maxProfit = 0
        for i in 1 ..< count {
            let price = prices[i] - prices[i-1]
            if price > 0 {
                maxProfit += price
            }
        }
        return maxProfit
    }
    
    // 方法二： 动态规划
    // https://leetcode.cn/problems/best-time-to-buy-and-sell-stock-ii/solution/tan-xin-suan-fa-by-liweiwei1419-2/
    func maxProfit2(_ prices: [Int]) -> Int {

        /*
        第 1 步：定义状态
        状态 dp[i][j] 定义如下：

        dp[i][j] 表示到下标为 i 的这一天，持股状态为 j 时，我们手上拥有的最大现金数。

        注意：限定持股状态为 j 是为了方便推导状态转移方程，这样的做法满足 无后效性。

        其中：

        第一维 i 表示下标为 i 的那一天（ 具有前缀性质，即考虑了之前天数的交易 ）；
        第二维 j 表示下标为 i 的那一天是持有股票，还是持有现金。这里 0 表示持有现金（cash），1 表示持有股票（stock）。
        第 2 步：思考状态转移方程
        状态从持有现金（cash）开始，到最后一天我们关心的状态依然是持有现金（cash）；

         第 3 步：确定初始值
         起始的时候：

         如果什么都不做，dp[0][0] = 0；
         如果持有股票，当前拥有的现金数是当天股价的相反数，即 dp[0][1] = -prices[i]；
         
         第 4 步：确定输出值
         终止的时候，上面也分析了，输出 dp[len - 1][0]，因为一定有 dp[len - 1][0] > dp[len - 1][1]。

        
         
         public class Solution {

             public int maxProfit(int[] prices) {
                 int len = prices.length;
                 if (len < 2) {
                     return 0;
                 }

                 // 0：持有现金
                 // 1：持有股票
                 // 状态转移：0 → 1 → 0 → 1 → 0 → 1 → 0
                 int[][] dp = new int[len][2];

                 dp[0][0] = 0;
                 dp[0][1] = -prices[0];

                 for (int i = 1; i < len; i++) {
                     // 这两行调换顺序也是可以的
                     dp[i][0] = Math.max(dp[i - 1][0], dp[i - 1][1] + prices[i]);
                     dp[i][1] = Math.max(dp[i - 1][1], dp[i - 1][0] - prices[i]);
                 }
                 return dp[len - 1][0];
             }
         }

         作者：liweiwei1419
         链接：https://leetcode.cn/problems/best-time-to-buy-and-sell-stock-ii/solution/tan-xin-suan-fa-by-liweiwei1419-2/
         来源：力扣（LeetCode）
         著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
         
         */
        return 0
    }
}

let maxProfit = Solution().maxProfit([7,1,5,3,6,4])
print(maxProfit)


