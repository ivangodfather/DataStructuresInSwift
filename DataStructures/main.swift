//
//  main.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 15/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

func myBinarySearch<T: Comparable>(value: T, array: [T]) -> Bool {
    guard !array.isEmpty else {
        return false
    }
    let middle = array.count / 2
    let elem = array[middle]
    switch elem {
    case value: return true
    case _ where value < elem:
        let newArray = array[array.startIndex...middle - 1]
        return myBinarySearch(value: value, array: Array(newArray))
    case _ where value > elem:
        let newArray = array[middle + 1..<array.endIndex]
        return myBinarySearch(value: value, array: Array(newArray))
    default: fatalError()
    }
}

func calculateTime(block : (() -> Void)) {
    let start = DispatchTime.now()
    block()
    let end = DispatchTime.now()
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    let timeInterval = Double(nanoTime) / 1_000_000_000
    print("Time: \(timeInterval) seconds")
}


let arr = [1,2,3,4]
print(arr[arr.endIndex - 1])
print(myBinarySearch(value: 4, array: arr))
