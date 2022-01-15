import UIKit

class BinarySearchTree<T: Comparable> {
    private(set) var value: T
    private(set) var parent: BinarySearchTree?
    private(set) var left: BinarySearchTree?
    private(set) var right: BinarySearchTree?
    
    init(value: T) {
        self.value = value
    }
    
    public convenience init(array: [T]) {
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(value: v)
        }
    }
    
    public var isRoot: Bool {
        parent == nil
    }
    
    public var isLeaf: Bool {
        parent?.left == nil && parent?.right == nil
    }
    
    public var isLeftChild: Bool {
        parent?.left === self
    }
    
    public var isRightChild: Bool {
        parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        left != nil
    }
    
    public var hasRightChild: Bool {
        right != nil
    }
    
    public var hasAnyChild: Bool {
        hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    public func search(value: T) -> BinarySearchTree? {
        if value < self.value {
            return left?.search(value: value)
        } else if value > self.value {
            return right?.search(value: value)
        } else {
            return self
        }
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description)"
        }
        return s
    }
}

let tree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1])

print(tree)

tree.search(value: 5)
tree.search(value: 2)
tree.search(value: 7)
tree.search(value: 6)   // nil
