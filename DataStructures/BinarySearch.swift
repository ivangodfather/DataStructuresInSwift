//
//  BinarySearch.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 21/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

extension RandomAccessCollection where Element: Comparable {

    func binarySearch(value: Element, in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        guard range.lowerBound < range.upperBound else {
            return nil
        }

        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        if self[middle] == value {
            return middle
        } else if self[middle] > value {
            return binarySearch(value: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(value: value, in: index(after: middle)..<range.upperBound)
        }
    }
}

func binarySearch<Elements: RandomAccessCollection>(
  for element: Elements.Element,
  in collection: Elements,
  in range: Range<Elements.Index>? = nil) -> Elements.Index?
  where Elements.Element: Comparable {

  let range = range ?? collection.startIndex..<collection.endIndex
  guard range.lowerBound < range.upperBound else {
    return nil
  }
  let size = collection.distance(from: range.lowerBound,
                                 to: range.upperBound)
  let middle = collection.index(range.lowerBound, offsetBy: size / 2)
  if collection[middle] == element {
    return middle
  } else if collection[middle] > element {
    return binarySearch(for: element, in: collection, in: range.lowerBound..<middle)
  } else {
    return binarySearch(for: element,
                        in: collection,
                        in: collection.index(after: middle)..<range.upperBound)
  }
}
