//
//  Counter.swift
//  Counter
//
//  Created by Viraj Chitnis on 7/13/20.
//  Copyright © 2020 Viraj Chitnis. All rights reserved.
//

import Foundation

class Counter: ObservableObject {
    var id: UUID
    var name: String
    var description: String
    @Published var count: Int
    
    init(id: UUID = UUID(), name: String, description: String = "", count: Int = 0) {
        self.id = id
        self.name = name
        self.description = description
        self.count = count
    }
    
    func increment(by amount: Int = 1) {
        self.count += amount
    }
    
    func decrement(by amount: Int = 1) {
        self.count -= amount
    }
}

typealias CodableCounters = [CodableCounter]
struct CodableCounter: Codable {
    var id: UUID
    var name: String
    var description: String
    var count: Int
}
