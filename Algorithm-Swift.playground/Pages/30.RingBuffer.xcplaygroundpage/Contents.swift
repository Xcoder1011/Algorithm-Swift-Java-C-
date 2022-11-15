
/* 29.RingBuffer
 
 队列是一种特殊的线性表，原则就是先进先出，只能从头取数据，从尾部插入数据。

 什么是ring buffer（circular buffer）
 一种环形数据结构，其长度是固定的，进出规则是FIFO先进先出，如果空间被填满了，之后写入的数据，会覆盖掉之前的数据。
 
 */


public class RingBuffer<T> {
    
    fileprivate var capacity = 0
    fileprivate var size = 0
    fileprivate var buffers: [T?]
    
    fileprivate var readIndex = 0
    fileprivate var writeIndex = 0

    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.buffers = Array(repeating: nil, count: capacity)
    }
    
    public func enqueue(_ element: T) -> Bool {
        if isFull {
            return false
        }
        buffers[writeIndex % capacity] = element
        writeIndex += 1
        size += 1
        return true
    }
    
    
    public func dequeue() -> T? {
        if size == 0 { // Empty
            return nil
        }
        let element = buffers[readIndex % capacity]
        readIndex += 1
        size -= 1
        return element
    }
    
    public var isFull: Bool {
        return size == capacity
    }
}

let ring = RingBuffer<Int>(5)
ring.enqueue(1)
ring.enqueue(2)
ring.enqueue(3)
ring.enqueue(4)

ring.enqueue(7)
ring.enqueue(8)
print("RingBuffer dequeue = \(String(describing: ring.dequeue()))")
ring.enqueue(9)
print("RingBuffer dequeue = \(String(describing: ring.dequeue()))")
