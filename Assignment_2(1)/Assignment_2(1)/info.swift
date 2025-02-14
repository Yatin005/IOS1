//
//  info.swift
//  Assignment_2(1)
//
//  Created by Yatin Parulkar on 2025-02-14.
//

import Foundation
class Product {
    
    var name : String

    init(name: String) {
        self.name = name
    }
}


class ProgrammingClassManager {
    // MVC
    var listOfStudnets = [
        Product(name: "John Lee"),
        Product(name: "Mary Smith"),
        Product(name: "George Dao"),
    ]
    
    func addNewProduct (newPrd: Product) {
        listOfStudnets.append(newPrd)
    }
}
