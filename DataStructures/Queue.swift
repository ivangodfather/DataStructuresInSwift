//
//  Queue.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 16/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

protocol Queue {
    associatedtype T
    mutating func enqueue(element: T) -> Bool
    mutating func dequeue() -> T?
    var isEmpty: Bool { get }
    var peek: T? { get }
}

struct QueueArray<T>: Queue {
    
    private var storage = [T]()
    
    var isEmpty: Bool { storage.isEmpty }
    var peek: T? { storage.first }
    
    mutating func enqueue(element: T) -> Bool {
        storage.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        isEmpty ? nil : storage.removeFirst()
    }
}
