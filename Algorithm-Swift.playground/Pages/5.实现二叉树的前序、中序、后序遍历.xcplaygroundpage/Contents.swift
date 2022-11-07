
/* 5.实现二叉树的前序、中序、后序遍历

 题目描述：
 分别按照二叉树先序，中序和后序打印所有的节点。

 示例：

 输入:
 {1,2,3}
 
 返回值:
 [[1,2,3],[2,1,3],[2,3,1]]

  输入:
      5
    /   \
   1     4
  / \   / \
 2  7   3  6
  
  输出:
  前序遍历：5 1 2 7 4 3 6
  中序遍历：2 1 7 5 3 4 6
  后序遍历：2 7 1 3 6 4 5
  层序遍历：5 1 4 2 7 3 6
 
*/

public class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    public init(_ val:Int = 0, left: TreeNode?, right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public class Solution {
    /**
     * 代码中的类名、方法名、参数名已经指定，请勿修改，直接返回方法规定的值即可
     *
     * @param root TreeNode类 the root of binary tree
     * @return int整型二维数组
     */
    func threeOrders ( _ root: TreeNode?) -> [[Int]] {
        // write code here
        var reslut = [[Int]]()
        reslut.append(preorderTraversal(root))
        reslut.append(inorderTraversal(root))
        reslut.append(postorderTraversal(root))
        return reslut
    }
    
    // 前序遍历
    func preorderTraversal2( _ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        if let node = root {
            result.append(node.val);
            result += preorderTraversal(node.left)
            result += preorderTraversal(node.right)
        }
        return result
    }
    
    // 前序遍历
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var result = [Int]()
        result.append(root.val)
        result += preorderTraversal(root.left)
        result += preorderTraversal(root.right)
        return result
    }
    
    // 中序遍历
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var result = [Int]()
        result += inorderTraversal(root.left)
        result.append(root.val)
        result += inorderTraversal(root.right)
        return result
    }
    
    // 后序遍历
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var result = [Int]()
        result += postorderTraversal(root.left)
        result += postorderTraversal(root.right)
        result.append(root.val)
        return result
    }
    
    // 层序遍历
    var res: [Int] = []
    func levelOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        levelNode([root])
        return res
    }
    func levelNode(_ nodes: [TreeNode?] ){
        if nodes.count == 0 {
            return
        }
        var newNodes: [TreeNode?] = []
        for node in nodes {
            res.append(node!.val)
            if node?.left != nil {
                newNodes.append(node?.left)
            }
            if node?.right != nil {
                newNodes.append(node?.right)
            }
        }
        levelNode(newNodes)
    }

}

let rootNode1 = TreeNode(1,left: nil,right: nil)
let rootNode2 = TreeNode(2,left: nil,right: nil)
let rootNode3 = TreeNode(3,left: nil,right: nil)
rootNode1.left = rootNode2
rootNode1.right = rootNode3

let r = Solution().threeOrders(rootNode1)
print("结果为：\(r)")
