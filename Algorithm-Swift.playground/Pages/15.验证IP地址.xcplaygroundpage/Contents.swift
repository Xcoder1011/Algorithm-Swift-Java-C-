
/*
 15.验证IP地址
 
 给定一个字符串 queryIP。如果是有效的 IPv4 地址，返回 "IPv4" ；如果是有效的 IPv6 地址，返回 "IPv6" ；如果不是上述类型的 IP 地址，返回 "Neither" 。
 
 有效的IPv4地址 是 “x1.x2.x3.x4” 形式的IP地址。 其中 0 <= xi <= 255 且 xi 不能包含 前导零。例如: “192.168.1.1” 、 “192.168.1.0” 为有效IPv4地址， “192.168.01.1” 为无效IPv4地址; “192.168.1.00” 、 “192.168@1.1” 为无效IPv4地址。
 
 一个有效的IPv6地址 是一个格式为“x1:x2:x3:x4:x5:x6:x7:x8” 的IP地址，其中:
 
 1 <= xi.length <= 4
 xi 是一个 十六进制字符串 ，可以包含数字、小写英文字母( 'a' 到 'f' )和大写英文字母( 'A' 到 'F' )。
 在 xi 中允许前导零。
 例如 "2001:0db8:85a3:0000:0000:8a2e:0370:7334" 和 "2001:db8:85a3:0:0:8A2E:0370:7334" 是有效的 IPv6 地址，而 "2001:0db8:85a3::8A2E:037j:7334" 和 "02001:0db8:85a3:0000:0000:8a2e:0370:7334" 是无效的 IPv6 地址。
 
  
 
 示例 1：
 
 输入：queryIP = "172.16.254.1"
 输出："IPv4"
 解释：有效的 IPv4 地址，返回 "IPv4"
 示例 2：
 
 输入：queryIP = "2001:0db8:85a3:0:0:8A2E:0370:7334"
 输出："IPv6"
 解释：有效的 IPv6 地址，返回 "IPv6"
 示例 3：
 
 输入：queryIP = "256.256.256.256"
 输出："Neither"
 解释：既不是 IPv4 地址，又不是 IPv6 地址
  
 
 提示：
 
 queryIP 仅由英文字母，数字，字符 '.' 和 ':' 组成。
 
 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/validate-ip-address
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */
public class Solution {
    /**
     * @param ip string字符串
     * @return string字符串
     */
    func validIPAddress ( _ ip: String) -> String {
        var itmes = ip.split(separator: ".", omittingEmptySubsequences: false)
        if itmes.count == 4 { // IPv4
            for itemStr in itmes {
                if itemStr.isEmpty || (itemStr.count > 1 && itemStr.hasPrefix("0")) {
                    return "Neither"
                }
                guard let num = Int(itemStr), (num <= 255 && num >= 0) else {
                    return "Neither"
                }
            }
            return "IPv4"
        }
        itmes = ip.split(separator: ":", omittingEmptySubsequences: false)
        if itmes.count == 8 { // IPv6
            for itemStr in itmes {
                guard !itemStr.isEmpty, itemStr.count >= 1 && itemStr.count <= 4 else {
                    return "Neither"
                    
                }
                for c in itemStr {
                    if !(c <= "F" && c >= "A" ||
                        c <= "f" && c >= "a" ||
                        c <= "9" && c >= "0") {
                        return "Neither"
                    }
                    
                }
            }
            return "IPv6"
        }
        return "Neither"
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var minPrice = Int.max
        for price in prices {
            minPrice  = min(minPrice, price)
            maxProfit = max(maxProfit, price - minPrice)
        }
        return maxProfit
    }
}


let solution = Solution()
//var result = solution.validIPAddress("172.16.254.1")
//print("result is \(result)")
//
//
//result = solution.validIPAddress(":2001:0db8:85a3:0:0:8A2E:0370:7334:")
//print("result is \(result)")
//
//
//result = solution.validIPAddress("2001:0db8:85a3:0:0:8A2E:0370:7334")
//print("result is \(result)")
//
//
//result = solution.validIPAddress("256.256.256.256")
//print("result is \(result)")



var result = solution.maxProfit([7,1,5,3,6,4])
print("result is \(result)")




