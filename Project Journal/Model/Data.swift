//
//  Data.swift
//  Project Journal
//
//  Created by Clyde Jackson on 3/17/25.
//

import Foundation

struct Project: Identifiable{
    let id: UUID = UUID()
    var name: String
    var description: String = ""
}
