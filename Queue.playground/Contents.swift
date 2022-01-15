import Foundation

public struct SimpleQueue<T> {
    private var array = [T]()
    
    public var count: Int {
        array.count
    }
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return array.removeFirst()
    }
    
    public var front: T? {
        array.first
    }
}

public struct OptimisedQueue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public var count: Int {
        array.count - head
    }
    
    public var isEmpty: Bool {
        count == 0
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty, let element = array[head] else { return nil }
        array[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(array.count) // I just pulled these numbers out of thin air -- you may need to tweak them based on the behavior of your app in a production environment.
        
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}

var q = OptimisedQueue<String>()
q.array                   // [] empty array

q.enqueue("Ada")
q.enqueue("Steve")
q.enqueue("Tim")
q.array             // [{Some "Ada"}, {Some "Steve"}, {Some "Tim"}]
q.count             // 3

q.dequeue()         // "Ada"
q.array             // [nil, {Some "Steve"}, {Some "Tim"}]
q.count             // 2

q.dequeue()         // "Steve"
q.array             // [nil, nil, {Some "Tim"}]
q.count             // 1

q.enqueue("Grace")
q.array             // [nil, nil, {Some "Tim"}, {Some "Grace"}]
q.count             // 2
