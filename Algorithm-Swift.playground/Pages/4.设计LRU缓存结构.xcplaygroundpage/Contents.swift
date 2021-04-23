
/* 4.设计LRU缓存结构
 题目描述：
 
 实现 LRUCache 类：
    LRUCache(int capacity) 以正整数作为容量 capacity 初始化 LRU 缓存
    int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
    void set(int key, int value) 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字-值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。

 示例：

 输入
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 输出
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 解释
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // 缓存是 {1=1}
 lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
 lRUCache.get(1);    // 返回 1
 lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
 lRUCache.get(2);    // 返回 -1 (未找到)
 lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
 lRUCache.get(1);    // 返回 -1 (未找到)
 lRUCache.get(3);    // 返回 3
 lRUCache.get(4);    // 返回 4
 
 */

// 方法一：哈希表 + 双向链表

// LRU 缓存算法的核心数据结构就是哈希链表，双向链表和哈希表的结合体。

// 双链表: head -> 最常用node -> node -> 最不常用node -> tail

public class LRUCache {
   
    // 节点
    class DlinkNode {
        let key: Int
        var value: Int
        
        var prev: DlinkNode?
        var next: DlinkNode?
     
        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    // 双链表
    class DoubleLinkedList {
        // 伪头部节点head， 伪尾部节点tail
        var head, tail : DlinkNode?
        // 链表元素数 (不包含 头尾的伪节点)
        var size: Int = 0
        init() {
            // 使用一个伪头部（dummy head）和伪尾部（dummy tail）标记界限，这样在添加节点和删除节点的时候就不需要检查相邻的节点是否存在。
            //  head -> 最常用node -> node -> 最不常用node -> tail
            head = DlinkNode(-1, -1)
            tail = DlinkNode(-1, -1)
            head?.next = tail
            tail?.prev = head
        }
        
        // 在链表头部添加节点 （每次在head后面添加!）
        func addNodeBehindHead(_ node: DlinkNode) {
            node.next = head?.next
            head?.next?.prev = node
            head?.next = node
            node.prev = head
            size += 1
        }
        
        // 删除链表中的节点（node一定存在）
        func remove(_ node: DlinkNode) {
            node.prev?.next = node.next
            node.next?.prev = node.prev
           size -= 1
        }
        
        // 删除链表中的最后一个节点, 并返回该节点
        func removeLastNode() -> DlinkNode {
            if size > 0 {
                if  let lastNode = tail?.prev {
                    remove(lastNode)
                    return lastNode
                }
            }
            return DlinkNode(-1, -1)
        }
    }
    
    // Hash表
    private var map: [Int : DlinkNode] = [:]
    // 最大容量
    private var capacity: Int = 0
    // 双链表
    // 双向链表 按照被使用的顺序存储了这些键值对，靠近头部的键值对是最近使用的
    private var linkList: DoubleLinkedList?
    
    init (_ capacity: Int) {
        self.capacity = capacity
        linkList = DoubleLinkedList()
    }
    
    func get(_ key: Int) -> Int {
        // 对于 get 操作，首先判断 key 是否存在
        guard let node: DlinkNode = map[key]  else {
             // 如果 key 不存在，则返回 -1
            print("输出 -1")
            return -1
        }
        // 如果 key 存在，则 key 对应的节点是最近被使用的节点。
        print("输出\(node.value)")
        // 通过哈希表定位到该节点在双向链表中的位置，并将其移动到双向链表的头部，
        put(key, node.value)
        // 最后返回该节点的值
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        // 对于 put 操作，首先判断 key 是否存在
        if let node: DlinkNode = map[key] {
            // 如果 key 存在，则与 get 操作类似，先通过哈希表定位，再将对应的节点的值更新为 value，并将该节点移到双向链表的头部。
            // 如果 key 存在，先创建一个新的节点。
            let newNode = DlinkNode(key, value)
            // 删除该旧节点
            linkList?.remove(node)
            // 在双向链表的头部添加新节点，这样每次更常用的数据再链表的前面， 靠近尾部的节点是最不常使用的数据
            linkList?.addNodeBehindHead(newNode)
            // 更新该节点的值
            map.updateValue(newNode, forKey: key)

        } else {
            // 如果 key 不存在，使用 key 和 value 创建一个新的节点，在双向链表的头部添加该节点
            if capacity == linkList?.size {
                // 判断双向链表的节点数是否达到最大容量，如果达到最大容量，则删除双向链表的尾部节点，
                let lastDeleteNode = linkList?.removeLastNode()
                // 并删除哈希表中对应的项；
                map.removeValue(forKey: lastDeleteNode?.key ?? -1)
            }
            let newNode = DlinkNode(key, value)
            // 在双向链表的头部添加该节点
            linkList?.addNodeBehindHead(newNode)
            // 并将 key 和该节点添加进哈希表中
            map.updateValue(newNode, forKey: key)
        }
    }
}

let lRUCache: LRUCache = LRUCache(2);
lRUCache.put(1, 1); // 缓存是 {1=1}
lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
lRUCache.get(1);    // 返回 1
lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
lRUCache.get(2);    // 返回 -1 (未找到)
lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
lRUCache.get(1);    // 返回 -1 (未找到)
lRUCache.get(3);    // 返回 3
lRUCache.get(4);    // 返回 4
/*
输出1
输出 -1
输出 -1
输出3
输出4
 */


/* 4.设计LRU缓存结构
 
 题目描述：
 
 设计LRU缓存结构，该结构在构造时确定大小，假设大小为K，并有如下两个功能
 
 set(key, value)：将记录(key, value)插入该结构
 get(key)：返回key对应的value值
 
 [要求]
 set和get方法的时间复杂度为O(1)
 某个key的set或get操作一旦发生，认为这个key的记录成了最常使用的。
 当缓存的大小超过K时，移除最不经常使用的记录，即set或get最久远的。
 
 若opt=1，接下来两个整数x, y，表示set(x, y)
 若opt=2，接下来一个整数x，表示get(x)，若x未出现过或已被移除，则返回-1
 对于每个操作2，输出一个答案
 
 
 示例1
 
 输入
 [[1,1,1],[1,2,2],[1,3,2],[2,1],[1,4,4],[2,2]],3
 
 返回值
 [1,-1]
 
 说明：
 第一次操作后：最常使用的记录为("1", 1)
 第二次操作后：最常使用的记录为("2", 2)，("1", 1)变为最不常用的
 第三次操作后：最常使用的记录为("3", 2)，("1", 1)还是最不常用的
 第四次操作后：最常用的记录为("1", 1)，("2", 2)变为最不常用的
 第五次操作后：大小超过了3，所以移除此时最不常使用的记录("2", 2)，加入记录("4", 4)，并且为最常使用的记录，然后("3", 2)变为最不常使用的记录
 
 */


public class Solution {
    /**
       方法一：哈希表 + 数组
     * @param operators int整型二维数组   [[opt],[opt]]
     * @param k int整型  , 大小为K
     * @return int整型一维数组
     */
    func LRU ( _ operators: [[Int]],  _ k: Int) -> [Int] {
        
        var dict: [Int : Int] = [:]
        var keys: [Int] = [] // 用来记录操作的key，按照顺序记录
        var results: [Int] = []  // 记录输出结果
        
        for nums in operators {
            print("nums：\(nums)")
            if nums.isEmpty {
                continue
            }
            let opt = nums.first
            if opt == 1 { // 若opt=1， 接下来两个整数x, y，表示set(x, y)
                if nums.count > 2 { // 保证至少有3个数据， 否则是无效数据
                    let x = nums[1]
                    dict.updateValue(nums[2], forKey: x)
                    if keys.contains(x) {
                        if let deleteIndex =  keys.firstIndex(of: x) {
                            // 曾经处理过该数据，把之前处理的记录删除，再把当前的数据记录在keys最后面
                            keys.remove(at: deleteIndex)
                        }
                    }
                    keys.append(x)
                    print("set(\(x), \(nums[2]))   keys:\(keys) , dict:\(dict)")
                    if dict.count > k { // 当缓存的大小超过K时，移除最不经常使用的记录，即set或get最久远的。
                        // keys按照顺序记录了操作的所有key, 第一个数据就是最不常用的数据
                        dict.removeValue(forKey: keys[0])
                        // 缓存的大小超过k，移除第一个数据（也就是最不常用的数据）
                        keys.remove(at: 0)
                        print("缓存的大小超过\(k), 移除第一个数据后， keys:\(keys) , dict:\(dict)")
                    }
                } else {
                    continue
                }
            } else if (opt == 2) { // 若opt=2，接下来一个整数x，表示get(x)，
                if nums.count > 1 { // 保证至少有2个数据， 否则是无效数据
                    let x = nums[1]
                    if dict.keys.contains(x) {
                        if keys.contains(x) {
                            if let deleteIndex =  keys.firstIndex(of: x) {
                                // 曾经处理过该数据，把之前处理的记录删除，再把当前的数据记录在keys最后面
                                keys.remove(at: deleteIndex)
                            }
                        }
                        results.append(dict[x] ?? -1)
                        keys.append(x)
                    } else { // 若x未出现过或已被移除，则返回-1
                        results.append(-1)
                    }
                    print("get(\(x), \(dict[x] ?? -1))   keys:\(keys) , dict:\(dict)")
                } else {
                    continue
                }
            }
        }
        return results
    }
}

var operators = [[1,1,1],[1,2,2],[1,3,2],[2,1],[1,4,4],[2,2]]
var reult = Solution().LRU(operators, 3)
print("输出：\(reult)")
