
import Foundation


/* 33.前K个高频元素
 
 给你一个整数数组 nums 和一个整数 k ，请你返回其中出现频率前 k 高的元素。你可以按 任意顺序 返回答案。
 
 
 
 示例 1:
 
 输入: nums = [1,1,1,2,2,3], k = 2
 输出: [1,2]
 示例 2:
 
 输入: nums = [1], k = 1
 输出: [1]
 
 进阶：你所设计算法的时间复杂度 必须 优于 O(n log n) ，其中 n 是数组大小。
 
 */

class Solution {
    
    static func topKFrequent1(_ nums:[Int], _ k: Int) -> [Int] {
        var dict:[Int : Int] = [:]
        for num in nums {
            // key为num, value存储出现的次数
            dict[num, default: 0] += 1
        }
        // 按照出现的次数进行逆排序，取出对应num数组， 取前k个值的key
        let results = dict.sorted(by: {$0.value > $1.value}).map { $0.key }
        return Array(results[0..<k])
    }
    
    static func topKFrequen2(_ nums:[Int], _ k: Int) -> [Int] {
        // 按照出现的次数进行逆排序，取出对应num数组， 取前k个值的key
        let results = nums.reduce(into: [:]) { (dict, num) in
            dict[num, default: 0] += 1
        }.sorted(by: { $0.1 > $1.1}).prefix(k).map { $0.0 }
        return results
    }
}

var result = Solution.topKFrequent1([1,1,1,2,2,3], 2)
print("topK1 = \(result)")

result = Solution.topKFrequent1([1], 1)
print("topK2 = \(result)")

