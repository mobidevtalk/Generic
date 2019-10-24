//: [Index](Index)

import Foundation

// MARK: - Generic Stack
struct Stack<Element>{
    private var items = [Element]()
    
    mutating func push(item: Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeLast()
    }
}

var intStack = Stack<Int>()
intStack.push(item: 200)
intStack.push(item: 2)

intStack.pop()

var stringStack = Stack<String>()
stringStack.push(item: "mobidevtalk")
stringStack.push(item: ".com")

stringStack.pop()


// MARK: - Generic Queue
struct Queue<Element>{
    private var items = [Element]()
    
    mutating func enqueue(item: Element){
        items.append(item)
    }
    
    mutating func dequeue() -> Element{
        return items.removeFirst()
    }
}

var intQueue = Queue<Int>()
intQueue.enqueue(item: 200)
intQueue.enqueue(item: 2)

intQueue.dequeue()

var stringQueue = Queue<String>()
stringQueue.enqueue(item: "mobidevtalk")
stringQueue.enqueue(item: ".com")

stringQueue.dequeue()

