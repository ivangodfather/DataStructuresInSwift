//
//  Tree.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 16/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class TreeNode<T> {
    var value: T
    var children: [TreeNode] = []
    
    init(_ value: T, children: [TreeNode] = []) {
        self.value = value
        self.children = children
    }
    
    func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension TreeNode {
    func depthFirstTraversal(visit: (TreeNode) -> ()) {
        visit(self)
        children.forEach {
            $0.depthFirstTraversal(visit: visit)
        }
    }
    
    func levelOrderTraversal(visit: (TreeNode) -> ()) {
        var queue = Queue<TreeNode>()
        
        children.forEach {
            visit($0)
            
        }
    }
}



