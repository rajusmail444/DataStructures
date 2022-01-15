import Foundation

public struct stack<T> {
    fileprivate var array = [T]()
    
    public var count: Int {
        array.count
    }
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    
    public var top: T? {
        array.last
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        array.popLast()
    }
}


