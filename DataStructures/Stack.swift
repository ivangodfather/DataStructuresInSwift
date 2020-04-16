//
//  Stack.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 16/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

struct Stack<T> {
  
  private var storage: [T] = []
  
   init() { }
  
   init(_ t: [T]) {
    storage = t
  }
  
   mutating func push(_ t: T) {
    storage.append(t)
  }
  
  @discardableResult
   mutating func pop() -> T? {
    storage.popLast()
  }
  
   func peek() -> T? {
    storage.last
  }
  
   var isEmpty: Bool {
    peek() == nil
  }
}
