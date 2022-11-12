
import Foundation

/* 28.对称二叉树
 
 题目描述：
 给你一个二叉树的根节点 root ， 检查它是否轴对称。
 
 
 示例：
 
 输入：root = [1,2,2,3,4,4,3]
 输出：true
 
 输入：root = [1,2,2,null,3,null,3]
 输出：false
 */


class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    public init(_ val:Int = 0, left: TreeNode?, right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    init(_ val: Int) {
        self.val = val; self.left = nil; self.right = nil
    }
    init() {
        self.val = 0; self.left = nil; self.right = nil
    }
}

class Solution {
    // 方法一： 递归
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if let root = root {
            return isEqual(root.left, root.right)
        } else {
            return false
        }
    }
    
    // 判断左子树和右子树是否相等
    func isEqual(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        // 递归的终止条件是两个节点都为空， 对称
        if left == nil && right == nil {
            return true
        }
        // 两个节点中有一个为空，一个不为空， 不对称
        if left == nil || right == nil {
            return false
        }
        // 两个节点的值不相等， 不对称
        if left?.val != right?.val {
            return false
        }
        // 递归的比较 左节点的左孩子 和 右节点的右孩子
        // 左子树的左孩子 == 右子树的右孩子
        // 左子树的右孩子 == 右子树的左孩子
        return isEqual(left?.left, right?.right) && isEqual(left?.right, right?.left)
    }
}

let rootNode1 = TreeNode(1)
let rootNode2 = TreeNode(2)
let rootNode3 = TreeNode(3)
rootNode1.left = rootNode2
rootNode1.right = rootNode3

let isSymmetric = Solution().isSymmetric(rootNode1)
print("isSymmetric is \(isSymmetric)")
