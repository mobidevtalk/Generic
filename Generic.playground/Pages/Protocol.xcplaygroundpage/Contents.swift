//: [Index](Index)

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

// MARK: - Protocol with Generic
protocol DataOperator: CustomStringConvertible{
    associatedtype Component
    
    mutating func insert(item: Component)
    mutating func remove() throws -> Component
    func numberOfComponent() throws -> Int
}

struct Stack<Element>: DataOperator{
    var description: String{
        "Stack is a linear Data structure. Follows the LIFO(Last In First Out) pattarns. Only one tracker called Top."
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
    "Empty Stack"
}

stack.insert(item: 10)
stack.insert(item: 30)

for _ in 1..<4 {
    do {
        try stack.remove()
    } catch OperatingError.outOfBound {
        "Oops There is nothing to remove"
    }
}
