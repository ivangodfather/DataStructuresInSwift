//
//  HeapPriorityQueue.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 24/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

struct PriorityQueue<Element: Equatable>: Queue {
    mutating func enqueue(element: Element) -> Bool {
        heap.insert(element)
        return true
    }

    mutating func dequeue() -> Element? {
        heap.remove()
    }

    var isEmpty: Bool { heap.isEmpty }

    var peek: Element? { heap.peek }


    private var heap: Heap<Element> // 2

    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }

}
