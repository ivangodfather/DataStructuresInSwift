//
//  BinarySearchTree.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 17/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

struct BinarySearchTree<T: Comparable> {
    private(set) var root: BinaryNode<T>?
    
    init() {}
    
    mutating func insert(_ value: T) {
        root = insert(from: root, value: value)
    }
    
    func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
    
    func contains(_ value: T) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
                current = value < node.value ? node.leftChild : node.rightChild
        }
        return false
    }
    
    mutating func remove(_ value: T) {
        root = remove(from: root, value: value)
    }
    
    private func remove(from node: BinaryNode<T>?, value: T) -> BinaryNode<T>? {
        guard let node = node else {
            return nil
        }
        if node.value == value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            node.value = node.rightChild!.min.value
            node.rightChild = remove(from: node.rightChild, value: node.value)
        } else if node.value < value {
            node.leftChild = remove(from: node.leftChild, value:  value)
        } else {
            node.rightChild = remove(from: node.rightChild, value: value)
        }
        return node
    }
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        String(describing: root)
    }
}

extension BinaryNode {
    var min: BinaryNode {
        leftChild?.min ?? self
    }
}
