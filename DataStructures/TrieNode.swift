//
//  TrieNode.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 21/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class TrieNode<Key: Hashable> {

    var key: Key?
    weak var parent: TrieNode?
    var children: [Key: TrieNode] = [:]
    var isTerminating = false

    init(key: Key?, parent: TrieNode?) {
        self.key = key
        self.parent = parent
    }

}
