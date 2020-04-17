//
//  main.swift
//  DataStructures
//
//  Created by Ivan Ruiz Monjo on 15/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

var a = TreeNode("A")
var ab = TreeNode("AB")
var ac = TreeNode("AC")
a.add(ab)
a.add(ac)
let abc = TreeNode("ABC")
ab.add(abc)

let aca = TreeNode("ACA")
ac.add(aca)
let acaa = TreeNode("ACAA")
aca.add(acaa)

a.levelOrderTraversal(visit: { print($0.value)})
