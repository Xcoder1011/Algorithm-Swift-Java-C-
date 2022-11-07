/*
 
 9.快速排序
 
 快速排序使用分治法（Divide and conquer）策略来把一个串行（list）分为两个子串行（sub-lists）。
 
 思路：
 
 1.从序列中，任选一个记录k作为轴值pivot （基准）
 
 选择策略： 选择中间的值的下标为pivot
 
 2.重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。
 在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作；
 
 3. 递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序；
 
 将剩余的元素，分割成 左子序列 L 和 右子序列 R
 
 L 中所有元素都 < k， R 中所有元素都 > k
 
 对 L 和 R递归进行快排，直到子序列中有 0 个 或者 1 个元素，退出
 
 
 快速排序的最坏运行情况是 O(n²)，比如说顺序数列的快排。
 但它的平摊期望时间是 O(nlogn)，且 O(nlogn) 记号中隐含的常数因子很小，比复杂度稳定等于 O(nlogn) 的归并排序要小很多。
 所以，对绝大多数顺序性较弱的随机数列而言，快速排序总是优于归并排序。
 
 */


public class Solution {
    
    func sort(nums: [Int]) {
        var array = nums  // 对nums进行参数拷贝，不改变参数内容
        print("初始nums:  \(array)");
        quickSort(nums: &array, left: 0, right: array.count-1);
        print("排序后nums:  \(array)");
    }
    
    // 获取基准值的下标
    func pivotIndexWith(nums: inout[Int], left: Int, right: Int) -> Int {
        // 每次假设取第一个值为基准值，先用一个值记录该基准值
        let tempPivot = nums[left]
        var left = left
        var right = right
        print("获取基准值的下标： [\(left), \(right)], 基准值：\(tempPivot)")
        
        // 一直循环到 left 和 right 位置重合为止
        while (left < right) {
            
            while (left < right) {
                // 从最右边值开始 往左边查找
                if (nums[right] < tempPivot) {
                    // 当右边的值 小于 基准值， 就把右边的数据放在 左边
                    nums[left] = nums[right]
                    left += 1  // 左边的下标界限往右移动一位
                    break
                } else {
                    right -= 1  // 继续保持往左边查找
                }
            }
            
            while (left < right) {
                // 从最左边值开始 往右边查找
                if (nums[left] > tempPivot) {
                    // 当左边的值 大于 基准值， 就把左边的数据放在 右边
                    nums[right] = nums[left]
                    right -= 1   // 右边的下标界限往左移动一位
                    break
                } else {
                    left += 1 // 继续保持往右边查找
                }
            }
        }
        
        // 当 left 和 right 重合时
        // 记录的基准值 放在 重合的位置
        nums[left] = tempPivot
        
        return left;
    }
    
    // [left, right]
    // 在变量名字前面用&符号修饰表示，传递给inout参数，表明这个变量在参数内部是可以被改变的
    func quickSort(nums: inout[Int], left: Int, right: Int){
        guard !nums.isEmpty else {
            return
        }
        // 当下标重合或者只剩下个2个元素进行比较的时候， 说明已经排好序了，无需再排
        if (right - left) < 2 {
            print("已经排好序了 quickSort范围： [\(left), \(right)]");
            return
        }
        print("quickSort: \(nums)")
        print("quickSort下标： [\(left), \(right)]")
        
        let pivotIndex = pivotIndexWith(nums: &nums, left: left, right: right)
        
        // 对基准值的 左侧数组 进行排序
        quickSort(nums: &nums, left: left, right: pivotIndex)
        // 对基准值的 右侧数组 进行排序
        quickSort(nums: &nums, left: pivotIndex + 1, right: right)
    }
}

let solution = Solution()
solution.sort(nums:  [9, 6, 1, 7, 3, 0, 8, 2, 4, 5, 10])


/*
 
 初始nums:  [9, 6, 1, 7, 3, 0, 8, 2, 4, 5, 10]
 quickSort: [9, 6, 1, 7, 3, 0, 8, 2, 4, 5, 10]
 quickSort下标： [0, 10]
 获取基准值的下标： [0, 10], 基准值：9
 quickSort: [5, 6, 1, 7, 3, 0, 8, 2, 4, 9, 10]
 quickSort下标： [0, 9]
 获取基准值的下标： [0, 9], 基准值：5
 quickSort: [4, 2, 1, 0, 3, 5, 8, 7, 6, 9, 10]
 quickSort下标： [0, 5]
 获取基准值的下标： [0, 5], 基准值：4
 quickSort: [3, 2, 1, 0, 4, 5, 8, 7, 6, 9, 10]
 quickSort下标： [0, 4]
 获取基准值的下标： [0, 4], 基准值：3
 quickSort: [0, 2, 1, 3, 4, 5, 8, 7, 6, 9, 10]
 quickSort下标： [0, 3]
 获取基准值的下标： [0, 3], 基准值：0
 已经排好序了 quickSort范围： [0, 0]
 quickSort: [0, 2, 1, 3, 4, 5, 8, 7, 6, 9, 10]
 quickSort下标： [1, 3]
 获取基准值的下标： [1, 3], 基准值：2
 已经排好序了 quickSort范围： [1, 2]
 已经排好序了 quickSort范围： [3, 3]
 已经排好序了 quickSort范围： [4, 4]
 已经排好序了 quickSort范围： [5, 5]
 quickSort: [0, 1, 2, 3, 4, 5, 8, 7, 6, 9, 10]
 quickSort下标： [6, 9]
 获取基准值的下标： [6, 9], 基准值：8
 quickSort: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
 quickSort下标： [6, 8]
 获取基准值的下标： [6, 8], 基准值：6
 已经排好序了 quickSort范围： [6, 6]
 已经排好序了 quickSort范围： [7, 8]
 已经排好序了 quickSort范围： [9, 9]
 已经排好序了 quickSort范围： [10, 10]
 排序后nums:  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

 */
