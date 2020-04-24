//
//  Heap.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 24/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

struct Heap<Element: Equatable> {

    var elements: [Element] = []
    let sort: (Element, Element) -> Bool

    init(sort: @escaping (Element, Element) -> Bool,
         elements: [Element] = []) {
        self.sort = sort
        self.elements = elements

        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(index: i)
            }
        }
    }

    var isEmpty: Bool {  elements.isEmpty }
    var peek: Element? { elements.first }
    func leftChildIndex(parentIndex: Int) -> Int { 2 * parentIndex + 1 }
    func rightChildIndex(parentIndex: Int) -> Int {  leftChildIndex(parentIndex: parentIndex) + 1 }
    func parentIndex(childIndex: Int) -> Int { (childIndex - 1) / 2 }

    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, elements.count - 1)
        defer {
            siftDown(index: 0)
        }

        return elements.removeLast()
    }

    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(index: elements.count - 1)
    }

    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil // 1
        }
        if index == elements.count - 1 {
            return elements.removeLast() // 2
        } else {
            elements.swapAt(index, elements.count - 1) // 3
            defer {
                siftDown(index: index) // 5
                siftUp(index: index)
            }
            return elements.removeLast() // 4
        }
    }

    func index(of element: Element, startingAt i: Int) -> Int? {
        if i >= elements.count {
            return nil // 1
        }
        if sort(element, elements[i]) {
            return nil // 2
        }
        if element == elements[i] {
            return i // 3
        }
        if let j = index(of: element, startingAt: leftChildIndex(parentIndex: i)) {
            return j // 4
        }
        if let j = index(of: element, startingAt: rightChildIndex(parentIndex: i)) {
            return j // 5
        }
        return nil // 6
    }

    private mutating func siftUp(index: Int) {
        var child = index
        var parent = parentIndex(childIndex: index)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(childIndex: child)
        }
    }

    private mutating func siftDown(index: Int) {
        var parentIndex = index
        while true {
            let left = leftChildIndex(parentIndex: parentIndex)
            let right = rightChildIndex(parentIndex: parentIndex)
            var candidateIndex = parentIndex
            if left < elements.count && sort(elements[left], elements[parentIndex]) {
                candidateIndex = left
            }
            if right < elements.count && sort(elements[right], elements[candidateIndex]) {
                candidateIndex = right
            }
            if candidateIndex == parentIndex {
                return
            }
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }

}
