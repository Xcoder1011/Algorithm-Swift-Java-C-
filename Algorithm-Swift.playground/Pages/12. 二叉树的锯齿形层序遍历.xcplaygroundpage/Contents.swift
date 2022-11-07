
import Foundation

/*
 
 12.二叉树的锯齿形层序遍历
 
 给你二叉树的根节点 root ，返回其节点值的 锯齿形层序遍历 。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
 
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
}


class Solution {
    
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        
        var ans: [[Int]] = []
        
        func levelOrder(_ node: TreeNode?, level: Int) {
            
            if node == nil { return }
            if ans.count <= level {
                ans.append([])
            }
            
            if let val = node?.val {
                if level % 2 == 1 {
                    ans[level].insert(val, at: 0)
                } else {
                    ans[level].append(val)
                }
            }
            
            levelOrder(node?.left, level: level + 1)
            levelOrder(node?.right, level: level + 1)
        }
        
        levelOrder(root, level: 0)
        return ans
    }
}



