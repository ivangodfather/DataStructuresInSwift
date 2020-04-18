//
//  BinaryNode.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 17/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class BinaryNode<T> {
    var value: T
    var leftChild, rightChild: BinaryNode<T>?
    
    init(value: T) {
        self.value = value
    }
    
    func preOrderTraversal(visit: (BinaryNode) -> ()) {
        visit(self)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)
    }
    
    static func height(node: BinaryNode?) -> Int {
        guard let node = node else {
            return -1
        }
        return 1 + max(height(node: node.leftChild), height(node: node.rightChild))
    }
    
    func serialize() -> [T?] {
        
        func serialize(_ node: BinaryNode<T>?, visit: (T?) -> ()) {
            guard let node = node else {
                visit(nil)
                return
            }
            visit(node.value)
            serialize(node.leftChild, visit: visit)
            serialize(node.rightChild, visit: visit)
        }
        
        var output = [T?]()
        serialize(self) { node in
            output.append(node)
        }
        return output
    }
    

    // [5,1,2,3,nil...]
    
    static func deserialize(_ arr: [T?]) -> BinaryNode<T>? {
        var arr = arr
        return deserialize(&arr)
    }
    
    static private func deserialize(_ arr: inout  [T?]) -> BinaryNode<T>? {
        guard let value = arr.removeFirst() else {
            return nil
        }

        let node = BinaryNode(value: value)
        node.leftChild = deserialize(&arr)
        node.rightChild = deserialize(&arr)
        return node
    }

}

extension BinaryNode: CustomStringConvertible {

  public var description: String {
    diagram(for: self)
  }
  
  private func diagram(for node: BinaryNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.leftChild == nil && node.rightChild == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.rightChild,
                   top + " ", top + "┌──", top + "│ ")
         + root + "\(node.value)\n"
         + diagram(for: node.leftChild,
                   bottom + "│ ", bottom + "└──", bottom + " ")
  }
}
