//: [Index](Index)

//: [Swift Generic & Protocol](https://mobidevtalk.com/swift-generic-protocol/)

import Foundation

// MARK: - Generic Stack
struct DS_Stack<Element>{
    private var items = [Element]()
    
    mutating func push(item: Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeLast()
    }
}

var intStack = DS_Stack<Int>()
intStack.push(item: 200)
intStack.push(item: 2)

intStack.pop()

var stringStack = DS_Stack<String>()
stringStack.push(item: "mobidevtalk")
stringStack.push(item: ".com")

stringStack.pop()


// MARK: - Generic Queue
struct DS_Queue<Element>{
    private var items = [Element]()
    
    mutating func enqueue(item: Element){
        items.append(item)
    }
    
    mutating func dequeue() -> Element{
        return items.removeFirst()
    }
}

var intQueue = DS_Queue<Int>()
intQueue.enqueue(item: 200)
intQueue.enqueue(item: 2)

intQueue.dequeue()

var stringQueue = DS_Queue<String>()
stringQueue.enqueue(item: "mobidevtalk")
stringQueue.enqueue(item: ".com")

stringQueue.dequeue()

// MARK: - Error enum
enum OperatingError: Error{
    case outOfBound
    case empty
}

extension OperatingError: CustomStringConvertible{
    var description: String{
        switch self {
        case .outOfBound:
            return "Oops! There is nothing to remove"
        case .empty:
            return "Empty Stack"
        }
    }
}

// MARK: - Protocol with Generic
protocol DataOperator: CustomStringConvertible{
    associatedtype Component
    
    mutating func insert(item: Component)
    mutating func remove() throws -> Component
    func numberOfComponent() throws -> Int
}

// MARK: - Generic Stack with Generic protocol
struct Stack<Element>: DataOperator{
    var description: String{
        "Stack is a linear Data structure. Follows the LIFO(Last In First Out) patterns. Only one tracker called Top."
    }
    
    private var items = [Element]()
    
    private mutating func push(item: Element){
        items.append(item)
    }
    
    private mutating func pop() -> Element{
        return items.removeLast()
    }
    
    typealias Component = Element
    
    mutating func insert(item: Element) {
        push(item: item)
    }
    
    mutating func remove() throws -> Element {
        if items.count == 0 {
            throw OperatingError.outOfBound
        }else{
            return pop()
        }
    }
    
    func numberOfComponent() throws -> Int {
        let count = items.count
        if count == 0 {
            throw OperatingError.empty
        }else{
            return count
        }
    }
}

var stack = Stack<Int>()
stack.description

do {
    try stack.numberOfComponent()
} catch OperatingError.empty {
    OperatingError.empty.description
}

stack.insert(item: 10)
stack.insert(item: 30)

for _ in 1..<4 {
    do {
        try stack.remove()
    } catch OperatingError.outOfBound {
        OperatingError.outOfBound.description
    }
}

// MARK: - Generic Queue with Generic protocol
struct Queue<Element>: DataOperator{
    var description: String{
        "Queue is a linear Data structure. Follows the FIFO(First In First Out) patterns. Uses two tracker. Font for insertion. Rear for deletion"
    }
    
    private var items = [Element]()
    
    private mutating func enqueue(item: Element){
        items.append(item)
    }
    
    private mutating func dequeue() -> Element{
        return items.removeFirst()
    }
    
    typealias Component = Element
    
    mutating func insert(item: Element) {
        enqueue(item: item)
    }
    
    mutating func remove() throws -> Element {
        if items.count == 0 {
            throw OperatingError.outOfBound
        }else{
            return dequeue()
        }
    }
    
    func numberOfComponent() throws -> Int {
        let count = items.count
        if count == 0 {
            throw OperatingError.empty
        }else{
            return count
        }
    }
}

var queue = Queue<String>()
queue.description

do {
    try queue.numberOfComponent()
} catch OperatingError.empty {
    OperatingError.empty.description
}

queue.insert(item: "mobidevtalk")
queue.insert(item: ".com")

for _ in 1..<4 {
    do {
        try queue.remove()
    } catch OperatingError.outOfBound {
        OperatingError.outOfBound.description
    }
}

