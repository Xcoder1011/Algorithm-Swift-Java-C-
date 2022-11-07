
/*
 
 9.数字组合
 
 
 多多君最近在研究某种数字组合：
 定义为：每个数字的十进制表示中(0~9)，每个数位各不相同且各个数位之和等于N。
 满足条件的数字可能很多，找到其中的最小值即可。
 多多君还有很多研究课题，于是多多君找到了你--未来的计算机科学家寻求帮助。

 输入描述:
 共一行，一个正整数N，如题意所示，表示组合中数字不同数位之和。
 （1 <= N <= 1,000）

 输出描述:
 共一行，一个整数，表示该组合中的最小值。
 如果组合中没有任何符合条件的数字，那么输出-1即可。

 输入例子1:
 5

 输出例子1:
 5

 例子说明1:
 符合条件的数字有：5，14，23，32，41
 其中最小值为5

 输入例子2:
 12

 输出例子2:
 39

 例子说明2:


 输入例子3:
 50

 输出例子3:
 -1

 例子说明3:
 没有符合条件的数字 (Ｔ▽Ｔ)
 
 
 思路：
 
 45以上的数就会有重复  1+2+3+4+5+6+7+8+9 = n*(n+1)/2
 贪心，把最大的整数低位， 依次从后向前摆放剩下的数， 最小的数放在最高位，

 
 */

public class Solution {
    
    // 找到最小值
    static func printMinValue(N: Int) {
        print("输入 N:\(N)")
        // 45以上的数就会有重复  1+2+3+4+5+6+7+8+9 = n*(n+1)/2
        if N > ((1 + 9) * 9 / 2) {
            print(-1) // 组合中没有任何符合条件的数字，那么输出-1
            print("输出：-1\n")
        } else if (N <= 9) { // 只有一位的数字， 就是本身是最小值
            print(N)
            print("输出：\(N)\n")
        } else {
            // 10 ~ 45
            var N = N
            var res = 0   // 结果值 9，89，789，6789，56789 ...
            var maxNum = 9  // 当前位最大数
            var q = 1
            while (N > maxNum) {
                print("N:\(N), res:\(res), maxNum:\(maxNum), q:\(q)")
                N -= maxNum
                res += maxNum * q   // 9，89，789，6789，56789 ...
                q *= 10
                maxNum -= 1
            }
            
            if N != 0 {
                res += N * q
            }
            print(res)
            print("输出：\(res)\n")
        }
    }
}

Solution.printMinValue(N: 5)
Solution.printMinValue(N: 12)
Solution.printMinValue(N: 45)
Solution.printMinValue(N: 50)

/*
 
 输入 N:5
 5
 输出：5

 输入 N:12
 N:12, res:0, maxNum:9, q:1
 39
 输出：39

 输入 N:45
 N:45, res:0, maxNum:9, q:1
 N:36, res:9, maxNum:8, q:10
 N:28, res:89, maxNum:7, q:100
 N:21, res:789, maxNum:6, q:1000
 N:15, res:6789, maxNum:5, q:10000
 N:10, res:56789, maxNum:4, q:100000
 N:6, res:456789, maxNum:3, q:1000000
 N:3, res:3456789, maxNum:2, q:10000000
 123456789
 输出：123456789

 输入 N:50
 -1
 输出：-1



 */
