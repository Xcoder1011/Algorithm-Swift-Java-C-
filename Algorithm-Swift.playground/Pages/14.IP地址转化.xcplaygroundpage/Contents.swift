
/*
 14.IP地址转化
 
 描述:
 IP地址是一个用 '.' 隔开的四段数字，每段的大小是 0≤n≤255 。请你把 IP 地址转换成一个整数。(IPv4)
 
 例如， 114.55.207.244 的二进制表示是 01110010 00110111 11001111 11110100 ，其十进制表示是 1916260340
 
 输入：
 "114.55.207.244"
 复制
 返回值：
 "1916260340"
 
 */
public class Solution {
    /**
     * @param ip string字符串
     * @return string字符串
     */
    func IPtoNum ( _ ip: String) -> String {
        // 转二进制
        var str = ""
        if ip.count > 0 {
            let nums =  ip.split(separator: ".")
            if nums.count > 0 {
                for numStr in nums {
                    if let num = Int(numStr) {
                        var s = String(num, radix: 2)
                        // 不足8位，补足8位
                        while s.count < 8 {
                            s.insert("0", at: s.startIndex)
                        }
                        str.append(s)
                    }
                }
            }
        }
        
        // 二进制转十进制
        var sum = 0
        var i = 0
        for c in str.reversed() {
            if let num = Int("\(c)") {
                var p = 1
                if (i == 0) {
                    p = 1
                } else {
                    var index = 0
                    while index < i {
                        p = 2 * p
                        index += 1
                    }
                }
                // let p = Int(truncating: pow(2, i) as NSNumber)
                sum += (num * p)
            }
            i+=1
        }
        return "\(sum)"
    }
}

let solution = Solution()
var num = solution.IPtoNum("114.55.207.244")
print("num is \(num)")


num = solution.IPtoNum("0.0.0.1")
print("num is \(num)")



