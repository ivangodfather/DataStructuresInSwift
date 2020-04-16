//
//  LinkedList.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 15/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class Node<T>: CustomStringConvertible {
    var value: T
    var next: Node<T>?
    
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) " + String(describing: next)
    }
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<T> {
    
    var head: Node<T>?
    var tail: Node<T>?
    
    
    mutating func push(_ value: T) {
        copyNodes()
        head = Node(value: value, next: head)
        if tail == nil { tail = head }
    }
    
    mutating func append(_ value: T) {
        copyNodes()
        guard !isEmpty() else {
            push(value)
            return
        }
        
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    func isEmpty() -> Bool {
        head == nil
    }
    
    func node(atIndex: Int) -> Node<T>? {
        var currentNode = head
        var index = 0
        while currentNode != nil && index < atIndex {
            currentNode = currentNode?.next
            index += 1
        }
        return currentNode
    }
    
    @discardableResult
    mutating func insert(value: T, afterNode: Node<T>) -> Node<T> {
        copyNodes()
        guard tail !== afterNode  else {
            append(value)
            return tail!
        }
        
        afterNode.next = Node(value: value, next: afterNode.next)
        return afterNode.next!
    }
    
    @discardableResult
    mutating func pop() -> Node<T>? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty() {
                tail = head
            }
        }
        return head
    }
    
    @discardableResult
    mutating func removeLast() -> Node<T>? {
        copyNodes()
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        tail = prev
        tail?.next = nil
        return current
    }
    
    
    @discardableResult
    mutating func removeAfter(node: Node<T>) -> Node<T>? {
        guard let node = copyNodes(returningCopyOf: node) else { return nil }
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        
        return node.next
    }
    
    mutating func reverseList() {
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil
        while let nextCurrent = current {
            let next = nextCurrent.next
            current?.next = prev
            prev = current
            current = next
        }
        head = prev
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return head.description
    }
}

extension LinkedList {
    
    private mutating func copyNodes() {
        
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
    
    
    
    mutating func copyNodes(returningCopyOf node: Node<T>?) -> Node<T>? {
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        guard var oldNode = head else {
            return nil
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<T>?
        
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        
        return nodeCopy
    }
}
